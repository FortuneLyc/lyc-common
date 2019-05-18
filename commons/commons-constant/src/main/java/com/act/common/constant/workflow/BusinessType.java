
package com.act.common.constant.workflow;

import com.act.common.orm.type.LongEnum;
import com.act.common.other.type.DescribeType;

/**
 * ClassName: BusinessType <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2017年7月30日 下午10:11:01 <br/>
 * @author   lyc
 * @version

 * @see
 */
public enum BusinessType implements LongEnum, DescribeType {
	/**
	 * 例子1
	 */

	website_Monitor(BusinessType.SYS_DNS, 1043,"违规域名监测"),
	website_Dispose(BusinessType.SYS_DNS, 1023,"违规域名处置"),
	is_basedata_check(BusinessType.SYS_DNS, 10,"基础数据核验"),
	is_black_list_ircs(BusinessType.SYS_DNS, 1070,"黑名单网站"),
	ircs_basedata_query(BusinessType.SYS_DNS, 2000,"基础数据查询"),
	cs_public_query(BusinessType.SYS_DNS, 102 ,"部省公共查询请求"),
	domain_recursion_parse_query(BusinessType.SYS_DNS, 2006 ,"域名递归解析信息查询"),
	push_command(BusinessType.SYS_DNS, 2005 ,"疑似与异常数据推送指令"),
	ircs_basedata_request(BusinessType.SYS_DNS, 2001 ,"部省应用处置请求"),
	cs_collaborate_task_post(BusinessType.SYS_DNS, 100 ,"省级协办提出业务"),
	cs_collaborate_task_receive(BusinessType.SYS_DNS, 101 ,"省级协办执行省业务"),
	is_log_param(BusinessType.SYS_DNS, 2010 ,"日志参数"),
	is_code_list(BusinessType.SYS_DNS, 1060 ,"代码表"),
	other_website_dispose(BusinessType.SYS_DNS, 55,"其他系统违规处置业务"),
	app_monitor(BusinessType.SYS_APP, 1500L, "违规APP监测"), 
	app_dispose(BusinessType.SYS_APP, 1501L, "违规APP处置"),
	adms_document_flow(BusinessType.SYS_ADMS, 1000, "公文流转")
	;

	private static final long SYS_DNS = 1L;
	private static final long SYS_APP = 2L;
	private static final long SYS_ADMS = 3L;

	private final long type;
	private final long systemType;
	private final String desc;

	private BusinessType(long systemType, long type, String desc){
		this.systemType = systemType;
		this.type = type;
		this.desc = desc;
	}

	static {
		for (BusinessType bt : BusinessType.values()) {
			for (BusinessType bt1 : BusinessType.values()) {
				if (!bt.equals(bt1) && bt.getLongType().equals(bt1.getLongType())) {
					throw new IllegalArgumentException("BusinessType重复:" + bt1);
				}
			}
		}
	}

	@Override
	public Long getLongType() {
		return this.type;
	}

	@Override
	public String getDescribe() {
		return desc;
	}
	public Long getSystemType() {
		return systemType;
	}


}