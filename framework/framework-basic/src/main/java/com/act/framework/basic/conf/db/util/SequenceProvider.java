
package com.act.framework.basic.conf.db.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.executor.keygen.Jdbc3KeyGenerator;
import org.apache.ibatis.executor.keygen.KeyGenerator;
import org.apache.ibatis.executor.keygen.NoKeyGenerator;
import org.apache.ibatis.executor.keygen.SelectKeyGenerator;
import org.apache.ibatis.mapping.*;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.apache.ibatis.scripting.defaults.RawSqlSource;
import org.apache.ibatis.session.Configuration;

import tk.mybatis.mapper.entity.EntityColumn;
import tk.mybatis.mapper.entity.EntityTable;
import tk.mybatis.mapper.mapperhelper.EntityHelper;
import tk.mybatis.mapper.mapperhelper.MapperHelper;
import tk.mybatis.mapper.provider.base.BaseInsertProvider;

/**
 * ClassName: SequenceProvider <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2016年12月5日 下午1:36:01 <br/>
 * @author   lyc
 * @version
 */
public class SequenceProvider extends BaseInsertProvider {


//	private static Logger logger = LoggerFactory.getLogger(SequenceProvider.class);

    public SequenceProvider(Class<?> mapperClass, MapperHelper mapperHelper) {
        super(mapperClass, mapperHelper);
    }

    /**
     * @see //tk.mybatis.mapper.mapperhelper.MapperTemplate.getIDENTITY(EntityColumn column)
     */
    public static final String TABLE_NAME_TAG = "{3}";
    public static final String TABLE_ID_TAG = "{1}";
    public static final String DEFAULT_SEQUENCE_NAME_TEMPLATE = " "+TABLE_NAME_TAG+"_se.NEXTVAL ";
    public static final String DEFAULT_SEQUENCE_SQL_TEMPLATE = "select"+SequenceProvider.DEFAULT_SEQUENCE_NAME_TEMPLATE+"from dual";

    public static final String DEFAULT_SEQUENCE_NAME_TEMPLATE_PG = " nextval('"+TABLE_NAME_TAG+"_"+TABLE_ID_TAG+"_seq') ";
    public static final String DEFAULT_SEQUENCE_SQL_TEMPLATE_PG = "select"+SequenceProvider.DEFAULT_SEQUENCE_NAME_TEMPLATE_PG;

    /**
     * 新建SelectKey节点
     *
     * @param ms
     * @param column
     */
    @Override
	protected void newSelectKeyMappedStatement(MappedStatement ms, EntityColumn column) {
        String keyId = ms.getId() + SelectKeyGenerator.SELECT_KEY_SUFFIX;
        if (ms.getConfiguration().hasKeyGenerator(keyId)) {
            return;
        }
        Class<?> entityClass = getEntityClass(ms);
        //defaults
        Configuration configuration = ms.getConfiguration();
        KeyGenerator keyGenerator;
        String generator = (column.getGenerator() == null || column.getGenerator().equals("")) ? getIDENTITY() : column.getGenerator();
        String order = StringUtils.substringBefore(generator, "|");
        Boolean executeBefore;
        String IDENTITY;

        //mycode
        if ("before".equalsIgnoreCase(order)) {
        	executeBefore = true;
        	IDENTITY = StringUtils.substringAfter(generator, "|");
		} else if ("after".equalsIgnoreCase(order)) {
			executeBefore = false;
			IDENTITY = StringUtils.substringAfter(generator, "|");
		} else {
			executeBefore = isBEFORE();
			IDENTITY = generator;
		}

        if (IDENTITY.equalsIgnoreCase(DEFAULT_SEQUENCE_SQL_TEMPLATE) || IDENTITY.equalsIgnoreCase(DEFAULT_SEQUENCE_SQL_TEMPLATE_PG)) {
        	String tableName = tableName(entityClass);

        	IDENTITY = IDENTITY.replace(TABLE_NAME_TAG, tableName);

            final EntityTable entityTable = EntityHelper.getEntityTable(entityClass);
            for (EntityColumn entityColumn : entityTable.getEntityClassPKColumns()) {
                IDENTITY = IDENTITY.replace(TABLE_ID_TAG, entityColumn.getColumn());
            }
		}

        if (IDENTITY.equalsIgnoreCase("JDBC")) {
            keyGenerator = new Jdbc3KeyGenerator();
        } else {
            SqlSource sqlSource = new RawSqlSource(configuration, IDENTITY, entityClass);

            MappedStatement.Builder statementBuilder = new MappedStatement.Builder(configuration, keyId, sqlSource, SqlCommandType.SELECT);
            statementBuilder.resource(ms.getResource());
            statementBuilder.fetchSize(null);
            statementBuilder.statementType(StatementType.STATEMENT);
            statementBuilder.keyGenerator(new NoKeyGenerator());
            statementBuilder.keyProperty(column.getProperty());
            statementBuilder.keyColumn(null);
            statementBuilder.databaseId(null);
            statementBuilder.lang(configuration.getDefaultScriptingLanguageInstance());
            statementBuilder.resultOrdered(false);
            statementBuilder.resultSets(null);
            statementBuilder.timeout(configuration.getDefaultStatementTimeout());

            List<ParameterMapping> parameterMappings = new ArrayList<ParameterMapping>();
            ParameterMap.Builder inlineParameterMapBuilder = new ParameterMap.Builder(
                    configuration,
                    statementBuilder.id() + "-Inline",
                    entityClass,
                    parameterMappings);
            statementBuilder.parameterMap(inlineParameterMapBuilder.build());

            List<ResultMap> resultMaps = new ArrayList<ResultMap>();
            ResultMap.Builder inlineResultMapBuilder = new ResultMap.Builder(
                    configuration,
                    statementBuilder.id() + "-Inline",
                    column.getJavaType(),
                    new ArrayList<ResultMapping>(),
                    null);
            resultMaps.add(inlineResultMapBuilder.build());
            statementBuilder.resultMaps(resultMaps);
            statementBuilder.resultSetType(null);

            statementBuilder.flushCacheRequired(false);
            statementBuilder.useCache(false);
            statementBuilder.cache(null);

            MappedStatement statement = statementBuilder.build();
            try {
                configuration.addMappedStatement(statement);
            } catch (Exception e) {
                //ignore
            }
            MappedStatement keyStatement = configuration.getMappedStatement(keyId, false);
            keyGenerator = new tk.mybatis.mapper.mapperhelper.SelectKeyGenerator(keyStatement, executeBefore);// 这里通过重写set方法实现了id有值的时候不使用生成值
            try {
                configuration.addKeyGenerator(keyId, keyGenerator);
            } catch (Exception e) {
                //ignore
            }
        }
        //keyGenerator
        try {
            MetaObject msObject = SystemMetaObject.forObject(ms);
            msObject.setValue("keyGenerator", keyGenerator);
            msObject.setValue("keyProperties", column.getTable().getKeyProperties());
            msObject.setValue("keyColumns", column.getTable().getKeyColumns());
        } catch (Exception e) {
            //ignore
        }
    }

	public String singleTableInsert(MappedStatement ms) {
		return this.insert(ms);
	}

	public String singleTableInsertSelective(MappedStatement ms) {
		return this.insertSelective(ms);
	}

	public String getNewId(MappedStatement ms) {
		Class<?> entityClass = getEntityClass(ms);
		Set<EntityColumn> PKColumns = EntityHelper.getPKColumns(entityClass);
		for (EntityColumn entityColumn : PKColumns) {
			String identity = getIDENTITY(entityColumn);
			if (StringUtils.isNotBlank(identity)) {
				return identity;
			}
		}
		throw new IllegalArgumentException("ID生成器配置错误");
	}

}

