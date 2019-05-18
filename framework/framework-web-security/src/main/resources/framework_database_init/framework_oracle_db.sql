/*
Navicat Oracle Data Transfer
Oracle Client Version : 12.1.0.2.0

Source Server         : dns_136_oracle 自动提交
Source Server Version : 110200
Source Host           : 172.31.25.136:1521
Source Schema         : DNS_GJ

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2017-07-20 09:56:32
*/

-- ----------------------------
-- Table structure for WF_BUSINESS
-- ----------------------------
DROP TABLE WF_STATE;
CREATE TABLE WF_STATE (
ID NUMBER(32) NOT NULL ,
STATE_ID NUMBER(32) NOT NULL ,
STATE_NAME VARCHAR2(200) NOT NULL ,
BUSINESS_TYPE NUMBER(10) NOT NULL ,
CLASS_ALIAX VARCHAR2(200) ,
ICON_CLASS VARCHAR2(200) ,
FRONT_STATE_JSON VARCHAR2(2000) ,
BUS_STATE_MAP_JSON VARCHAR2(2000) ,
WF_PAGE_TYPES NUMBER(10) DEFAULT 0 ,
IS_BRANCH NUMBER(2) DEFAULT 0 ,
IS_BATCH NUMBER(2) DEFAULT 0 ,
IS_HEAD NUMBER(2) DEFAULT 0 ,
NEXT_STATE_ID_STR VARCHAR2(2000) ,
ROLE_ID NUMBER(32) ,
USER_ID NUMBER(32)
)
tablespace SMCS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
alter table WF_STATE
  add constraint PK_WF_STATE primary key (ID)
  using index
  tablespace SMCS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
CREATE SEQUENCE WF_STATE_SE
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 1
 NOCACHE ;


-- ----------------------------
-- Table structure for WF_BUSINESS
-- ----------------------------
DROP TABLE WF_BUSINESS;
CREATE TABLE WF_BUSINESS (
ID NUMBER(32) NOT NULL ,
BUSINESS_TYPE NUMBER(10) NOT NULL ,
BUSINESS_NAME VARCHAR2(200) NOT NULL
)
tablespace SMCS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
alter table WF_BUSINESS
  add constraint PK_WF_BUSINESS primary key (ID)
  using index
  tablespace SMCS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
CREATE SEQUENCE WF_BUSINESS_SE
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 1
 NOCACHE ;

-- ----------------------------
-- Table structure for API
-- ----------------------------
DROP TABLE API;
CREATE TABLE API (
ID NUMBER(32) NOT NULL ,
REMARK VARCHAR2(500),
URL VARCHAR2(200) NOT NULL ,
IS_ENABLE NUMBER(4) NOT NULL
)
tablespace SMCS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
alter table API
  add constraint PK_API primary key (ID)
  using index
  tablespace SMCS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
CREATE SEQUENCE API_SE
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 1
 NOCACHE ;
-- ----------------------------
-- Table structure for API_ACCESS
-- ----------------------------
DROP TABLE API_ACCESS;
CREATE TABLE API_ACCESS (
ID NUMBER(32) NOT NULL ,
ROLE_ID NUMBER(32) NOT NULL ,
API_ID NUMBER(32) NOT NULL ,
DECISION NUMBER(4) NOT NULL
)
tablespace SMCS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
alter table API_ACCESS
  add constraint PK_API_ACCESS primary key (ID)
  using index
  tablespace SMCS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
CREATE SEQUENCE API_ACCESS_SE
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 1
 NOCACHE ;
-- ----------------------------
-- Records of API_ACCESS
-- ----------------------------

-- ----------------------------
-- Table structure for AREA_INFO
-- ----------------------------
DROP TABLE REA_INF;
CREATE TABLE AREA_INFO (
ID NUMBER(11) NOT NULL ,
AREA_CODE VARCHAR2(7) NOT NULL ,
AREA_NAME VARCHAR2(20) NOT NULL ,
AREA_TYPE NUMBER(11) NOT NULL ,
PARENT_CODE VARCHAR2(7),
REMARK VARCHAR2(200),
ENABLE NUMBER(4) NOT NULL
)
tablespace SMCS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
alter table AREA_INFO
  add constraint PK_AREA_INFO primary key (ID)
  using index
  tablespace SMCS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
CREATE SEQUENCE AREA_INFO_SE
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 4000
 NOCACHE ;
-- ----------------------------
-- Records of AREA_INFO
-- ----------------------------
INSERT INTO AREA_INFO VALUES ('589', '410700', '新乡市', '2', '410000', null, '1');
INSERT INTO AREA_INFO VALUES ('590', '410701', '市辖区', '3', '410700', null, '1');
INSERT INTO AREA_INFO VALUES ('591', '410702', '红旗区', '3', '410700', null, '1');
INSERT INTO AREA_INFO VALUES ('592', '410703', '卫滨区', '3', '410700', null, '1');
INSERT INTO AREA_INFO VALUES ('593', '410704', '凤泉区', '3', '410700', null, '1');
INSERT INTO AREA_INFO VALUES ('594', '410711', '牧野区', '3', '410700', null, '1');
INSERT INTO AREA_INFO VALUES ('595', '410721', '新乡县', '3', '410700', null, '1');
INSERT INTO AREA_INFO VALUES ('596', '410724', '获嘉县', '3', '410700', null, '1');
INSERT INTO AREA_INFO VALUES ('597', '410725', '原阳县', '3', '410700', null, '1');
INSERT INTO AREA_INFO VALUES ('598', '410726', '延津县', '3', '410700', null, '1');
INSERT INTO AREA_INFO VALUES ('599', '410727', '封丘县', '3', '410700', null, '1');
INSERT INTO AREA_INFO VALUES ('600', '411024', '鄢陵县', '3', '411000', null, '1');
INSERT INTO AREA_INFO VALUES ('601', '411025', '襄城县', '3', '411000', null, '1');
INSERT INTO AREA_INFO VALUES ('602', '411081', '禹州市', '3', '411000', null, '1');
INSERT INTO AREA_INFO VALUES ('603', '411082', '长葛市', '3', '411000', null, '1');
INSERT INTO AREA_INFO VALUES ('604', '411100', '漯河市', '2', '410000', null, '1');
INSERT INTO AREA_INFO VALUES ('605', '411101', '市辖区', '3', '411100', null, '1');
INSERT INTO AREA_INFO VALUES ('606', '411102', '源汇区', '3', '411100', null, '1');
INSERT INTO AREA_INFO VALUES ('607', '411103', '郾城区', '3', '411100', null, '1');
INSERT INTO AREA_INFO VALUES ('608', '411104', '召陵区', '3', '411100', null, '1');
INSERT INTO AREA_INFO VALUES ('609', '411121', '舞阳县', '3', '411100', null, '1');
INSERT INTO AREA_INFO VALUES ('610', '411122', '临颍县', '3', '411100', null, '1');
INSERT INTO AREA_INFO VALUES ('611', '411200', '三门峡市', '2', '410000', null, '1');
INSERT INTO AREA_INFO VALUES ('612', '411201', '市辖区', '3', '411200', null, '1');
INSERT INTO AREA_INFO VALUES ('613', '411202', '湖滨区', '3', '411200', null, '1');
INSERT INTO AREA_INFO VALUES ('614', '411221', '渑池县', '3', '411200', null, '1');
INSERT INTO AREA_INFO VALUES ('615', '411222', '陕县', '3', '411200', null, '1');
INSERT INTO AREA_INFO VALUES ('616', '411224', '卢氏县', '3', '411200', null, '1');
INSERT INTO AREA_INFO VALUES ('617', '411281', '义马市', '3', '411200', null, '1');
INSERT INTO AREA_INFO VALUES ('618', '411282', '灵宝市', '3', '411200', null, '1');
INSERT INTO AREA_INFO VALUES ('619', '411300', '南阳市', '2', '410000', null, '1');
INSERT INTO AREA_INFO VALUES ('620', '411301', '市辖区', '3', '411300', null, '1');
INSERT INTO AREA_INFO VALUES ('621', '411302', '宛城区', '3', '411300', null, '1');
INSERT INTO AREA_INFO VALUES ('622', '411303', '卧龙区', '3', '411300', null, '1');
INSERT INTO AREA_INFO VALUES ('623', '411321', '南召县', '3', '411300', null, '1');
INSERT INTO AREA_INFO VALUES ('624', '411322', '方城县', '3', '411300', null, '1');
INSERT INTO AREA_INFO VALUES ('625', '411623', '商水县', '3', '411600', null, '1');
INSERT INTO AREA_INFO VALUES ('626', '411624', '沈丘县', '3', '411600', null, '1');
INSERT INTO AREA_INFO VALUES ('627', '411625', '郸城县', '3', '411600', null, '1');
INSERT INTO AREA_INFO VALUES ('628', '411626', '淮阳县', '3', '411600', null, '1');
INSERT INTO AREA_INFO VALUES ('629', '411627', '太康县', '3', '411600', null, '1');
INSERT INTO AREA_INFO VALUES ('630', '411628', '鹿邑县', '3', '411600', null, '1');
INSERT INTO AREA_INFO VALUES ('631', '411681', '项城市', '3', '411600', null, '1');
INSERT INTO AREA_INFO VALUES ('632', '411700', '驻马店市', '2', '410000', null, '1');
INSERT INTO AREA_INFO VALUES ('633', '411701', '市辖区', '3', '411700', null, '1');
INSERT INTO AREA_INFO VALUES ('634', '411702', '驿城区', '3', '411700', null, '1');
INSERT INTO AREA_INFO VALUES ('635', '411721', '西平县', '3', '411700', null, '1');
INSERT INTO AREA_INFO VALUES ('636', '411722', '上蔡县', '3', '411700', null, '1');
INSERT INTO AREA_INFO VALUES ('637', '411723', '平舆县', '3', '411700', null, '1');
INSERT INTO AREA_INFO VALUES ('638', '411724', '正阳县', '3', '411700', null, '1');
INSERT INTO AREA_INFO VALUES ('639', '411725', '确山县', '3', '411700', null, '1');
INSERT INTO AREA_INFO VALUES ('640', '411726', '泌阳县', '3', '411700', null, '1');
INSERT INTO AREA_INFO VALUES ('641', '411727', '汝南县', '3', '411700', null, '1');
INSERT INTO AREA_INFO VALUES ('642', '411728', '遂平县', '3', '411700', null, '1');
INSERT INTO AREA_INFO VALUES ('643', '411729', '新蔡县', '3', '411700', null, '1');
INSERT INTO AREA_INFO VALUES ('644', '419000', '济源市', '2', '410000', null, '1');
INSERT INTO AREA_INFO VALUES ('645', '420111', '洪山区', '3', '420100', null, '1');
INSERT INTO AREA_INFO VALUES ('646', '420112', '东西湖区', '3', '420100', null, '1');
INSERT INTO AREA_INFO VALUES ('647', '420113', '汉南区', '3', '420100', null, '1');
INSERT INTO AREA_INFO VALUES ('648', '420114', '蔡甸区', '3', '420100', null, '1');
INSERT INTO AREA_INFO VALUES ('649', '420115', '江夏区', '3', '420100', null, '1');
INSERT INTO AREA_INFO VALUES ('650', '420116', '黄陂区', '3', '420100', null, '1');
INSERT INTO AREA_INFO VALUES ('651', '420117', '新洲区', '3', '420100', null, '1');
INSERT INTO AREA_INFO VALUES ('652', '420200', '黄石市', '2', '420000', null, '1');
INSERT INTO AREA_INFO VALUES ('653', '420201', '市辖区', '3', '420200', null, '1');
INSERT INTO AREA_INFO VALUES ('654', '420202', '黄石港区', '3', '420200', null, '1');
INSERT INTO AREA_INFO VALUES ('655', '420203', '西塞山区', '3', '420200', null, '1');
INSERT INTO AREA_INFO VALUES ('656', '420204', '下陆区', '3', '420200', null, '1');
INSERT INTO AREA_INFO VALUES ('657', '420205', '铁山区', '3', '420200', null, '1');
INSERT INTO AREA_INFO VALUES ('658', '420222', '阳新县', '3', '420200', null, '1');
INSERT INTO AREA_INFO VALUES ('659', '420281', '大冶市', '3', '420200', null, '1');
INSERT INTO AREA_INFO VALUES ('660', '420300', '十堰市', '2', '420000', null, '1');
INSERT INTO AREA_INFO VALUES ('661', '420301', '市辖区', '3', '420300', null, '1');
INSERT INTO AREA_INFO VALUES ('662', '420302', '茅箭区', '3', '420300', null, '1');
INSERT INTO AREA_INFO VALUES ('663', '420303', '张湾区', '3', '420300', null, '1');
INSERT INTO AREA_INFO VALUES ('664', '420321', '郧县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('665', '420322', '郧西县', '3', '420300', null, '1');
INSERT INTO AREA_INFO VALUES ('666', '420323', '竹山县', '3', '420300', null, '1');
INSERT INTO AREA_INFO VALUES ('667', '420324', '竹溪县', '3', '420300', null, '1');
INSERT INTO AREA_INFO VALUES ('668', '420325', '房县', '3', '420300', null, '1');
INSERT INTO AREA_INFO VALUES ('669', '420381', '丹江口市', '3', '420300', null, '1');
INSERT INTO AREA_INFO VALUES ('670', '420500', '宜昌市', '2', '420000', null, '1');
INSERT INTO AREA_INFO VALUES ('671', '420501', '市辖区', '3', '420500', null, '1');
INSERT INTO AREA_INFO VALUES ('672', '420502', '西陵区', '3', '420500', null, '1');
INSERT INTO AREA_INFO VALUES ('673', '420503', '伍家岗区', '3', '420500', null, '1');
INSERT INTO AREA_INFO VALUES ('674', '420504', '点军区', '3', '420500', null, '1');
INSERT INTO AREA_INFO VALUES ('675', '420505', '猇亭区', '3', '420500', null, '1');
INSERT INTO AREA_INFO VALUES ('676', '420506', '夷陵区', '3', '420500', null, '1');
INSERT INTO AREA_INFO VALUES ('677', '420525', '远安县', '3', '420500', null, '1');
INSERT INTO AREA_INFO VALUES ('678', '420526', '兴山县', '3', '420500', null, '1');
INSERT INTO AREA_INFO VALUES ('679', '420527', '秭归县', '3', '420500', null, '1');
INSERT INTO AREA_INFO VALUES ('680', '420528', '长阳土家族自治县', '3', '420500', null, '1');
INSERT INTO AREA_INFO VALUES ('681', '420529', '五峰土家族自治县', '3', '420500', null, '1');
INSERT INTO AREA_INFO VALUES ('682', '420581', '宜都市', '3', '420500', null, '1');
INSERT INTO AREA_INFO VALUES ('683', '420582', '当阳市', '3', '420500', null, '1');
INSERT INTO AREA_INFO VALUES ('684', '420583', '枝江市', '3', '420500', null, '1');
INSERT INTO AREA_INFO VALUES ('685', '420600', '襄樊市', '2', '420000', null, '1');
INSERT INTO AREA_INFO VALUES ('686', '420601', '市辖区', '3', '420600', null, '1');
INSERT INTO AREA_INFO VALUES ('687', '420602', '襄城区', '3', '420600', null, '1');
INSERT INTO AREA_INFO VALUES ('688', '420606', '樊城区', '3', '420600', null, '1');
INSERT INTO AREA_INFO VALUES ('689', '420607', '襄阳区', '3', '420600', null, '1');
INSERT INTO AREA_INFO VALUES ('690', '420624', '南漳县', '3', '420600', null, '1');
INSERT INTO AREA_INFO VALUES ('691', '420625', '谷城县', '3', '420600', null, '1');
INSERT INTO AREA_INFO VALUES ('692', '420626', '保康县', '3', '420600', null, '1');
INSERT INTO AREA_INFO VALUES ('693', '420682', '老河口市', '3', '420600', null, '1');
INSERT INTO AREA_INFO VALUES ('694', '420683', '枣阳市', '3', '420600', null, '1');
INSERT INTO AREA_INFO VALUES ('695', '420684', '宜城市', '3', '420600', null, '1');
INSERT INTO AREA_INFO VALUES ('696', '420703', '华容区', '3', '420700', null, '1');
INSERT INTO AREA_INFO VALUES ('697', '420704', '鄂城区', '3', '420700', null, '1');
INSERT INTO AREA_INFO VALUES ('698', '420800', '荆门市', '2', '420000', null, '1');
INSERT INTO AREA_INFO VALUES ('699', '420801', '市辖区', '3', '420800', null, '1');
INSERT INTO AREA_INFO VALUES ('700', '420802', '东宝区', '3', '420800', null, '1');
INSERT INTO AREA_INFO VALUES ('701', '420804', '掇刀区', '3', '420800', null, '1');
INSERT INTO AREA_INFO VALUES ('702', '420821', '京山县', '3', '420800', null, '1');
INSERT INTO AREA_INFO VALUES ('703', '420822', '沙洋县', '3', '420800', null, '1');
INSERT INTO AREA_INFO VALUES ('704', '420881', '钟祥市', '3', '420800', null, '1');
INSERT INTO AREA_INFO VALUES ('705', '420900', '孝感市', '2', '420000', null, '1');
INSERT INTO AREA_INFO VALUES ('706', '420901', '市辖区', '3', '420900', null, '1');
INSERT INTO AREA_INFO VALUES ('707', '420902', '孝南区', '3', '420900', null, '1');
INSERT INTO AREA_INFO VALUES ('708', '420921', '孝昌县', '3', '420900', null, '1');
INSERT INTO AREA_INFO VALUES ('709', '420922', '大悟县', '3', '420900', null, '1');
INSERT INTO AREA_INFO VALUES ('710', '420923', '云梦县', '3', '420900', null, '1');
INSERT INTO AREA_INFO VALUES ('711', '420981', '应城市', '3', '420900', null, '1');
INSERT INTO AREA_INFO VALUES ('712', '420982', '安陆市', '3', '420900', null, '1');
INSERT INTO AREA_INFO VALUES ('713', '420984', '汉川市', '3', '420900', null, '1');
INSERT INTO AREA_INFO VALUES ('714', '421083', '洪湖市', '3', '421000', null, '1');
INSERT INTO AREA_INFO VALUES ('715', '421087', '松滋市', '3', '421000', null, '1');
INSERT INTO AREA_INFO VALUES ('716', '421100', '黄冈市', '2', '420000', null, '1');
INSERT INTO AREA_INFO VALUES ('717', '421101', '市辖区', '3', '421100', null, '1');
INSERT INTO AREA_INFO VALUES ('718', '421102', '黄州区', '3', '421100', null, '1');
INSERT INTO AREA_INFO VALUES ('719', '421121', '团风县', '3', '421100', null, '1');
INSERT INTO AREA_INFO VALUES ('720', '421122', '红安县', '3', '421100', null, '1');
INSERT INTO AREA_INFO VALUES ('721', '421123', '罗田县', '3', '421100', null, '1');
INSERT INTO AREA_INFO VALUES ('722', '421124', '英山县', '3', '421100', null, '1');
INSERT INTO AREA_INFO VALUES ('723', '421125', '浠水县', '3', '421100', null, '1');
INSERT INTO AREA_INFO VALUES ('724', '421126', '蕲春县', '3', '421100', null, '1');
INSERT INTO AREA_INFO VALUES ('725', '421127', '黄梅县', '3', '421100', null, '1');
INSERT INTO AREA_INFO VALUES ('726', '421181', '麻城市', '3', '421100', null, '1');
INSERT INTO AREA_INFO VALUES ('727', '421182', '武穴市', '3', '421100', null, '1');
INSERT INTO AREA_INFO VALUES ('728', '421200', '咸宁市', '2', '420000', null, '1');
INSERT INTO AREA_INFO VALUES ('729', '421201', '市辖区', '3', '421200', null, '1');
INSERT INTO AREA_INFO VALUES ('730', '421202', '咸安区', '3', '421200', null, '1');
INSERT INTO AREA_INFO VALUES ('731', '421221', '嘉鱼县', '3', '421200', null, '1');
INSERT INTO AREA_INFO VALUES ('732', '430101', '市辖区', '3', '430100', null, '1');
INSERT INTO AREA_INFO VALUES ('733', '430102', '芙蓉区', '3', '430100', null, '1');
INSERT INTO AREA_INFO VALUES ('734', '430103', '天心区', '3', '430100', null, '1');
INSERT INTO AREA_INFO VALUES ('735', '430104', '岳麓区', '3', '430100', null, '1');
INSERT INTO AREA_INFO VALUES ('1', '140826', '绛县', '3', '140800', null, '1');
INSERT INTO AREA_INFO VALUES ('2', '140827', '垣曲县', '3', '140800', null, '1');
INSERT INTO AREA_INFO VALUES ('3', '140828', '夏县', '3', '140800', null, '1');
INSERT INTO AREA_INFO VALUES ('4', '140829', '平陆县', '3', '140800', null, '1');
INSERT INTO AREA_INFO VALUES ('5', '140830', '芮城县', '3', '140800', null, '1');
INSERT INTO AREA_INFO VALUES ('6', '140881', '永济市', '3', '140800', null, '1');
INSERT INTO AREA_INFO VALUES ('7', '140882', '河津市', '3', '140800', null, '1');
INSERT INTO AREA_INFO VALUES ('8', '140900', '忻州市', '2', '140000', null, '1');
INSERT INTO AREA_INFO VALUES ('9', '140901', '市辖区', '3', '140900', null, '1');
INSERT INTO AREA_INFO VALUES ('10', '140902', '忻府区', '3', '140900', null, '1');
INSERT INTO AREA_INFO VALUES ('11', '140921', '定襄县', '3', '140900', null, '1');
INSERT INTO AREA_INFO VALUES ('12', '140922', '五台县', '3', '140900', null, '1');
INSERT INTO AREA_INFO VALUES ('13', '140923', '代县', '3', '140900', null, '1');
INSERT INTO AREA_INFO VALUES ('14', '140924', '繁峙县', '3', '140900', null, '1');
INSERT INTO AREA_INFO VALUES ('15', '140925', '宁武县', '3', '140900', null, '1');
INSERT INTO AREA_INFO VALUES ('16', '140926', '静乐县', '3', '140900', null, '1');
INSERT INTO AREA_INFO VALUES ('17', '140927', '神池县', '3', '140900', null, '1');
INSERT INTO AREA_INFO VALUES ('18', '140928', '五寨县', '3', '140900', null, '1');
INSERT INTO AREA_INFO VALUES ('19', '140929', '岢岚县', '3', '140900', null, '1');
INSERT INTO AREA_INFO VALUES ('20', '140930', '河曲县', '3', '140900', null, '1');
INSERT INTO AREA_INFO VALUES ('21', '140931', '保德县', '3', '140900', null, '1');
INSERT INTO AREA_INFO VALUES ('22', '140932', '偏关县', '3', '140900', null, '1');
INSERT INTO AREA_INFO VALUES ('23', '140981', '原平市', '3', '140900', null, '1');
INSERT INTO AREA_INFO VALUES ('24', '141000', '临汾市', '2', '140000', null, '1');
INSERT INTO AREA_INFO VALUES ('25', '141001', '市辖区', '3', '141000', null, '1');
INSERT INTO AREA_INFO VALUES ('26', '141002', '尧都区', '3', '141000', null, '1');
INSERT INTO AREA_INFO VALUES ('27', '141021', '曲沃县', '3', '141000', null, '1');
INSERT INTO AREA_INFO VALUES ('28', '141022', '翼城县', '3', '141000', null, '1');
INSERT INTO AREA_INFO VALUES ('29', '141023', '襄汾县', '3', '141000', null, '1');
INSERT INTO AREA_INFO VALUES ('30', '141024', '洪洞县', '3', '141000', null, '1');
INSERT INTO AREA_INFO VALUES ('31', '141025', '古县', '3', '141000', null, '1');
INSERT INTO AREA_INFO VALUES ('32', '141026', '安泽县', '3', '141000', null, '1');
INSERT INTO AREA_INFO VALUES ('33', '141027', '浮山县', '3', '141000', null, '1');
INSERT INTO AREA_INFO VALUES ('34', '141028', '吉县', '3', '141000', null, '1');
INSERT INTO AREA_INFO VALUES ('35', '141029', '乡宁县', '3', '141000', null, '1');
INSERT INTO AREA_INFO VALUES ('36', '141030', '大宁县', '3', '141000', null, '1');
INSERT INTO AREA_INFO VALUES ('37', '141031', '隰县', '3', '141000', null, '1');
INSERT INTO AREA_INFO VALUES ('38', '141032', '永和县', '3', '141000', null, '1');
INSERT INTO AREA_INFO VALUES ('39', '141033', '蒲县', '3', '141000', null, '1');
INSERT INTO AREA_INFO VALUES ('40', '141034', '汾西县', '3', '141000', null, '1');
INSERT INTO AREA_INFO VALUES ('41', '141081', '侯马市', '3', '141000', null, '1');
INSERT INTO AREA_INFO VALUES ('42', '141082', '霍州市', '3', '141000', null, '1');
INSERT INTO AREA_INFO VALUES ('43', '141100', '吕梁市', '2', '140000', null, '1');
INSERT INTO AREA_INFO VALUES ('44', '141101', '市辖区', '3', '141100', null, '1');
INSERT INTO AREA_INFO VALUES ('45', '141102', '离石区', '3', '141100', null, '1');
INSERT INTO AREA_INFO VALUES ('46', '141121', '文水县', '3', '141100', null, '1');
INSERT INTO AREA_INFO VALUES ('47', '141122', '交城县', '3', '141100', null, '1');
INSERT INTO AREA_INFO VALUES ('48', '141123', '兴县', '3', '141100', null, '1');
INSERT INTO AREA_INFO VALUES ('49', '141124', '临县', '3', '141100', null, '1');
INSERT INTO AREA_INFO VALUES ('50', '141125', '柳林县', '3', '141100', null, '1');
INSERT INTO AREA_INFO VALUES ('51', '141126', '石楼县', '3', '141100', null, '1');
INSERT INTO AREA_INFO VALUES ('52', '141127', '岚县', '3', '141100', null, '1');
INSERT INTO AREA_INFO VALUES ('53', '141128', '方山县', '3', '141100', null, '1');
INSERT INTO AREA_INFO VALUES ('54', '141129', '中阳县', '3', '141100', null, '1');
INSERT INTO AREA_INFO VALUES ('55', '141130', '交口县', '3', '141100', null, '1');
INSERT INTO AREA_INFO VALUES ('56', '141181', '孝义市', '3', '141100', null, '1');
INSERT INTO AREA_INFO VALUES ('57', '141182', '汾阳市', '3', '141100', null, '1');
INSERT INTO AREA_INFO VALUES ('58', '150000', '内蒙古自治区', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('59', '150100', '呼和浩特市', '2', '150000', null, '1');
INSERT INTO AREA_INFO VALUES ('60', '150101', '市辖区', '3', '150100', null, '1');
INSERT INTO AREA_INFO VALUES ('61', '150102', '新城区', '3', '150100', null, '1');
INSERT INTO AREA_INFO VALUES ('62', '150103', '回民区', '3', '150100', null, '1');
INSERT INTO AREA_INFO VALUES ('63', '150104', '玉泉区', '3', '150100', null, '1');
INSERT INTO AREA_INFO VALUES ('64', '150105', '赛罕区', '3', '150100', null, '1');
INSERT INTO AREA_INFO VALUES ('65', '150121', '土默特左旗', '3', '150100', null, '1');
INSERT INTO AREA_INFO VALUES ('66', '150122', '托克托县', '3', '150100', null, '1');
INSERT INTO AREA_INFO VALUES ('67', '150123', '和林格尔县', '3', '150100', null, '1');
INSERT INTO AREA_INFO VALUES ('68', '150124', '清水河县', '3', '150100', null, '1');
INSERT INTO AREA_INFO VALUES ('69', '150125', '武川县', '3', '150100', null, '1');
INSERT INTO AREA_INFO VALUES ('70', '150200', '包头市', '2', '150000', null, '1');
INSERT INTO AREA_INFO VALUES ('71', '150201', '市辖区', '3', '150200', null, '1');
INSERT INTO AREA_INFO VALUES ('72', '150202', '东河区', '3', '150200', null, '1');
INSERT INTO AREA_INFO VALUES ('73', '150203', '昆都仑区', '3', '150200', null, '1');
INSERT INTO AREA_INFO VALUES ('74', '150204', '青山区', '3', '150200', null, '1');
INSERT INTO AREA_INFO VALUES ('75', '150205', '石拐区', '3', '150200', null, '1');
INSERT INTO AREA_INFO VALUES ('76', '150206', '白云矿区', '3', '150200', null, '1');
INSERT INTO AREA_INFO VALUES ('77', '150207', '九原区', '3', '150200', null, '1');
INSERT INTO AREA_INFO VALUES ('78', '150221', '土默特右旗', '3', '150200', null, '1');
INSERT INTO AREA_INFO VALUES ('79', '150222', '固阳县', '3', '150200', null, '1');
INSERT INTO AREA_INFO VALUES ('80', '150223', '达尔罕茂明安联合旗', '3', '150200', null, '1');
INSERT INTO AREA_INFO VALUES ('81', '150300', '乌海市', '2', '150000', null, '1');
INSERT INTO AREA_INFO VALUES ('82', '150301', '市辖区', '3', '150300', null, '1');
INSERT INTO AREA_INFO VALUES ('83', '150302', '海勃湾区', '3', '150300', null, '1');
INSERT INTO AREA_INFO VALUES ('84', '150303', '海南区', '3', '150300', null, '1');
INSERT INTO AREA_INFO VALUES ('85', '150304', '乌达区', '3', '150300', null, '1');
INSERT INTO AREA_INFO VALUES ('86', '150400', '赤峰市', '2', '150000', null, '1');
INSERT INTO AREA_INFO VALUES ('87', '150401', '市辖区', '3', '150400', null, '1');
INSERT INTO AREA_INFO VALUES ('88', '150402', '红山区', '3', '150400', null, '1');
INSERT INTO AREA_INFO VALUES ('89', '150403', '元宝山区', '3', '150400', null, '1');
INSERT INTO AREA_INFO VALUES ('90', '150404', '松山区', '3', '150400', null, '1');
INSERT INTO AREA_INFO VALUES ('91', '150421', '阿鲁科尔沁旗', '3', '150400', null, '1');
INSERT INTO AREA_INFO VALUES ('92', '150422', '巴林左旗', '3', '150400', null, '1');
INSERT INTO AREA_INFO VALUES ('93', '150423', '巴林右旗', '3', '150400', null, '1');
INSERT INTO AREA_INFO VALUES ('94', '150424', '林西县', '3', '150400', null, '1');
INSERT INTO AREA_INFO VALUES ('95', '150425', '克什克腾旗', '3', '150400', null, '1');
INSERT INTO AREA_INFO VALUES ('96', '150426', '翁牛特旗', '3', '150400', null, '1');
INSERT INTO AREA_INFO VALUES ('97', '150428', '喀喇沁旗', '3', '150400', null, '1');
INSERT INTO AREA_INFO VALUES ('98', '150429', '宁城县', '3', '150400', null, '1');
INSERT INTO AREA_INFO VALUES ('99', '150430', '敖汉旗', '3', '150400', null, '1');
INSERT INTO AREA_INFO VALUES ('100', '150500', '通辽市', '2', '150000', null, '1');
INSERT INTO AREA_INFO VALUES ('101', '150501', '市辖区', '3', '150500', null, '1');
INSERT INTO AREA_INFO VALUES ('102', '150502', '科尔沁区', '3', '150500', null, '1');
INSERT INTO AREA_INFO VALUES ('103', '150521', '科尔沁左翼中旗', '3', '150500', null, '1');
INSERT INTO AREA_INFO VALUES ('104', '150522', '科尔沁左翼后旗', '3', '150500', null, '1');
INSERT INTO AREA_INFO VALUES ('105', '150523', '开鲁县', '3', '150500', null, '1');
INSERT INTO AREA_INFO VALUES ('106', '150524', '库伦旗', '3', '150500', null, '1');
INSERT INTO AREA_INFO VALUES ('107', '150525', '奈曼旗', '3', '150500', null, '1');
INSERT INTO AREA_INFO VALUES ('108', '150526', '扎鲁特旗', '3', '150500', null, '1');
INSERT INTO AREA_INFO VALUES ('109', '150581', '霍林郭勒市', '3', '150500', null, '1');
INSERT INTO AREA_INFO VALUES ('110', '150600', '鄂尔多斯市', '2', '150000', null, '1');
INSERT INTO AREA_INFO VALUES ('111', '150602', '东胜区', '3', '150600', null, '1');
INSERT INTO AREA_INFO VALUES ('112', '150621', '达拉特旗', '3', '150600', null, '1');
INSERT INTO AREA_INFO VALUES ('113', '150622', '准格尔旗', '3', '150600', null, '1');
INSERT INTO AREA_INFO VALUES ('114', '150623', '鄂托克前旗', '3', '150600', null, '1');
INSERT INTO AREA_INFO VALUES ('115', '150624', '鄂托克旗', '3', '150600', null, '1');
INSERT INTO AREA_INFO VALUES ('116', '150625', '杭锦旗', '3', '150600', null, '1');
INSERT INTO AREA_INFO VALUES ('117', '150626', '乌审旗', '3', '150600', null, '1');
INSERT INTO AREA_INFO VALUES ('118', '150627', '伊金霍洛旗', '3', '150600', null, '1');
INSERT INTO AREA_INFO VALUES ('119', '150700', '呼伦贝尔市', '2', '150000', null, '1');
INSERT INTO AREA_INFO VALUES ('120', '150701', '市辖区', '3', '150700', null, '1');
INSERT INTO AREA_INFO VALUES ('121', '150702', '海拉尔区', '3', '150700', null, '1');
INSERT INTO AREA_INFO VALUES ('122', '150721', '阿荣旗', '3', '150700', null, '1');
INSERT INTO AREA_INFO VALUES ('123', '150723', '鄂伦春自治旗', '3', '150700', null, '1');
INSERT INTO AREA_INFO VALUES ('124', '150724', '鄂温克族自治旗', '3', '150700', null, '1');
INSERT INTO AREA_INFO VALUES ('125', '150725', '陈巴尔虎旗', '3', '150700', null, '1');
INSERT INTO AREA_INFO VALUES ('126', '150726', '新巴尔虎左旗', '3', '150700', null, '1');
INSERT INTO AREA_INFO VALUES ('127', '150727', '新巴尔虎右旗', '3', '150700', null, '1');
INSERT INTO AREA_INFO VALUES ('128', '150781', '满洲里市', '3', '150700', null, '1');
INSERT INTO AREA_INFO VALUES ('129', '150782', '牙克石市', '3', '150700', null, '1');
INSERT INTO AREA_INFO VALUES ('130', '150783', '扎兰屯市', '3', '150700', null, '1');
INSERT INTO AREA_INFO VALUES ('131', '150784', '额尔古纳市', '3', '150700', null, '1');
INSERT INTO AREA_INFO VALUES ('132', '150785', '根河市', '3', '150700', null, '1');
INSERT INTO AREA_INFO VALUES ('133', '150800', '巴彦淖尔市', '2', '150000', null, '1');
INSERT INTO AREA_INFO VALUES ('134', '150801', '市辖区', '3', '150800', null, '1');
INSERT INTO AREA_INFO VALUES ('135', '150802', '临河区', '3', '150800', null, '1');
INSERT INTO AREA_INFO VALUES ('136', '150821', '五原县', '3', '150800', null, '1');
INSERT INTO AREA_INFO VALUES ('137', '150822', '磴口县', '3', '150800', null, '1');
INSERT INTO AREA_INFO VALUES ('138', '150823', '乌拉特前旗', '3', '150800', null, '1');
INSERT INTO AREA_INFO VALUES ('139', '150824', '乌拉特中旗', '3', '150800', null, '1');
INSERT INTO AREA_INFO VALUES ('140', '150825', '乌拉特后旗', '3', '150800', null, '1');
INSERT INTO AREA_INFO VALUES ('141', '150826', '杭锦后旗', '3', '150800', null, '1');
INSERT INTO AREA_INFO VALUES ('142', '150900', '乌兰察布市', '2', '150000', null, '1');
INSERT INTO AREA_INFO VALUES ('143', '150901', '市辖区', '3', '150900', null, '1');
INSERT INTO AREA_INFO VALUES ('144', '150902', '集宁区', '3', '150900', null, '1');
INSERT INTO AREA_INFO VALUES ('145', '150921', '卓资县', '3', '150900', null, '1');
INSERT INTO AREA_INFO VALUES ('146', '150922', '化德县', '3', '150900', null, '1');
INSERT INTO AREA_INFO VALUES ('147', '150923', '商都县', '3', '150900', null, '1');
INSERT INTO AREA_INFO VALUES ('148', '150924', '兴和县', '3', '150900', null, '1');
INSERT INTO AREA_INFO VALUES ('149', '150925', '凉城县', '3', '150900', null, '1');
INSERT INTO AREA_INFO VALUES ('150', '150926', '察哈尔右翼前旗', '3', '150900', null, '1');
INSERT INTO AREA_INFO VALUES ('151', '150927', '察哈尔右翼中旗', '3', '150900', null, '1');
INSERT INTO AREA_INFO VALUES ('152', '150928', '察哈尔右翼后旗', '3', '150900', null, '1');
INSERT INTO AREA_INFO VALUES ('153', '150929', '四子王旗', '3', '150900', null, '1');
INSERT INTO AREA_INFO VALUES ('154', '150981', '丰镇市', '3', '150900', null, '1');
INSERT INTO AREA_INFO VALUES ('155', '152200', '兴安盟', '2', '150000', null, '1');
INSERT INTO AREA_INFO VALUES ('156', '152201', '乌兰浩特市', '3', '152200', null, '1');
INSERT INTO AREA_INFO VALUES ('157', '152202', '阿尔山市', '3', '152200', null, '1');
INSERT INTO AREA_INFO VALUES ('158', '152221', '科尔沁右翼前旗', '3', '152200', null, '1');
INSERT INTO AREA_INFO VALUES ('159', '152222', '科尔沁右翼中旗', '3', '152200', null, '1');
INSERT INTO AREA_INFO VALUES ('160', '152223', '扎赉特旗', '3', '152200', null, '1');
INSERT INTO AREA_INFO VALUES ('161', '152224', '突泉县', '3', '152200', null, '1');
INSERT INTO AREA_INFO VALUES ('162', '152500', '锡林郭勒盟', '2', '150000', null, '1');
INSERT INTO AREA_INFO VALUES ('163', '152501', '二连浩特市', '3', '152500', null, '1');
INSERT INTO AREA_INFO VALUES ('164', '152502', '锡林浩特市', '3', '152500', null, '1');
INSERT INTO AREA_INFO VALUES ('165', '152522', '阿巴嘎旗', '3', '152500', null, '1');
INSERT INTO AREA_INFO VALUES ('166', '152523', '苏尼特左旗', '3', '152500', null, '1');
INSERT INTO AREA_INFO VALUES ('167', '152524', '苏尼特右旗', '3', '152500', null, '1');
INSERT INTO AREA_INFO VALUES ('168', '152525', '东乌珠穆沁旗', '3', '152500', null, '1');
INSERT INTO AREA_INFO VALUES ('169', '441623', '连平县', '3', '441600', null, '1');
INSERT INTO AREA_INFO VALUES ('170', '152526', '西乌珠穆沁旗', '3', '152500', null, '1');
INSERT INTO AREA_INFO VALUES ('171', '152527', '太仆寺旗', '3', '152500', null, '1');
INSERT INTO AREA_INFO VALUES ('172', '152528', '镶黄旗', '3', '152500', null, '1');
INSERT INTO AREA_INFO VALUES ('173', '152529', '正镶白旗', '3', '152500', null, '1');
INSERT INTO AREA_INFO VALUES ('174', '152530', '正蓝旗', '3', '152500', null, '1');
INSERT INTO AREA_INFO VALUES ('175', '152531', '多伦县', '3', '152500', null, '1');
INSERT INTO AREA_INFO VALUES ('176', '152900', '阿拉善盟', '2', '150000', null, '1');
INSERT INTO AREA_INFO VALUES ('177', '152921', '阿拉善左旗', '3', '152900', null, '1');
INSERT INTO AREA_INFO VALUES ('178', '152922', '阿拉善右旗', '3', '152900', null, '1');
INSERT INTO AREA_INFO VALUES ('179', '152923', '额济纳旗', '3', '152900', null, '1');
INSERT INTO AREA_INFO VALUES ('180', '210000', '辽宁省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('181', '210100', '沈阳市', '2', '210000', null, '1');
INSERT INTO AREA_INFO VALUES ('182', '210103', '沈河区', '3', '210100', null, '1');
INSERT INTO AREA_INFO VALUES ('183', '210104', '大东区', '3', '210100', null, '1');
INSERT INTO AREA_INFO VALUES ('184', '210105', '皇姑区', '3', '210100', null, '1');
INSERT INTO AREA_INFO VALUES ('185', '210106', '铁西区', '3', '210100', null, '1');
INSERT INTO AREA_INFO VALUES ('186', '210111', '苏家屯区', '3', '210100', null, '1');
INSERT INTO AREA_INFO VALUES ('187', '210112', '东陵区', '3', '210100', null, '1');
INSERT INTO AREA_INFO VALUES ('188', '210113', '沈北新区', '3', '210100', null, '1');
INSERT INTO AREA_INFO VALUES ('189', '210114', '于洪区', '3', '210100', null, '1');
INSERT INTO AREA_INFO VALUES ('190', '210122', '辽中县', '3', '210100', null, '1');
INSERT INTO AREA_INFO VALUES ('191', '210123', '康平县', '3', '210100', null, '1');
INSERT INTO AREA_INFO VALUES ('192', '210124', '法库县', '3', '210100', null, '1');
INSERT INTO AREA_INFO VALUES ('193', '210181', '新民市', '3', '210100', null, '1');
INSERT INTO AREA_INFO VALUES ('194', '210200', '大连市', '2', '210000', null, '1');
INSERT INTO AREA_INFO VALUES ('195', '210882', '大石桥市', '3', '210800', null, '1');
INSERT INTO AREA_INFO VALUES ('196', '230207', '碾子山区', '3', '230200', null, '1');
INSERT INTO AREA_INFO VALUES ('197', '230208', '梅里斯达斡尔族区', '3', '230200', null, '1');
INSERT INTO AREA_INFO VALUES ('198', '230221', '龙江县', '3', '230200', null, '1');
INSERT INTO AREA_INFO VALUES ('199', '230223', '依安县', '3', '230200', null, '1');
INSERT INTO AREA_INFO VALUES ('200', '230224', '泰来县', '3', '230200', null, '1');
INSERT INTO AREA_INFO VALUES ('201', '230225', '甘南县', '3', '230200', null, '1');
INSERT INTO AREA_INFO VALUES ('202', '230227', '富裕县', '3', '230200', null, '1');
INSERT INTO AREA_INFO VALUES ('203', '230229', '克山县', '3', '230200', null, '1');
INSERT INTO AREA_INFO VALUES ('204', '230230', '克东县', '3', '230200', null, '1');
INSERT INTO AREA_INFO VALUES ('205', '230231', '拜泉县', '3', '230200', null, '1');
INSERT INTO AREA_INFO VALUES ('206', '230281', '讷河市', '3', '230200', null, '1');
INSERT INTO AREA_INFO VALUES ('207', '230301', '市辖区', '3', '230300', null, '1');
INSERT INTO AREA_INFO VALUES ('208', '230302', '鸡冠区', '3', '230300', null, '1');
INSERT INTO AREA_INFO VALUES ('209', '230303', '恒山区', '3', '230300', null, '1');
INSERT INTO AREA_INFO VALUES ('210', '230304', '滴道区', '3', '230300', null, '1');
INSERT INTO AREA_INFO VALUES ('211', '320106', '鼓楼区', '3', '320100', null, '1');
INSERT INTO AREA_INFO VALUES ('212', '321181', '丹阳市', '3', '321100', null, '1');
INSERT INTO AREA_INFO VALUES ('213', '321182', '扬中市', '3', '321100', null, '1');
INSERT INTO AREA_INFO VALUES ('214', '321183', '句容市', '3', '321100', null, '1');
INSERT INTO AREA_INFO VALUES ('215', '340202', '镜湖区', '3', '340200', null, '1');
INSERT INTO AREA_INFO VALUES ('216', '340203', '弋江区', '3', '340200', null, '1');
INSERT INTO AREA_INFO VALUES ('217', '340207', '鸠江区', '3', '340200', null, '1');
INSERT INTO AREA_INFO VALUES ('218', '340208', '三山区', '3', '340200', null, '1');
INSERT INTO AREA_INFO VALUES ('219', '340221', '芜湖县', '3', '340200', null, '1');
INSERT INTO AREA_INFO VALUES ('220', '340222', '繁昌县', '3', '340200', null, '1');
INSERT INTO AREA_INFO VALUES ('221', '340223', '南陵县', '3', '340200', null, '1');
INSERT INTO AREA_INFO VALUES ('222', '340300', '蚌埠市', '2', '340000', null, '1');
INSERT INTO AREA_INFO VALUES ('223', '340301', '市辖区', '3', '340300', null, '1');
INSERT INTO AREA_INFO VALUES ('224', '340811', '宜秀区', '3', '340800', null, '1');
INSERT INTO AREA_INFO VALUES ('225', '340822', '怀宁县', '3', '340800', null, '1');
INSERT INTO AREA_INFO VALUES ('226', '340827', '望江县', '3', '340800', null, '1');
INSERT INTO AREA_INFO VALUES ('227', '340828', '岳西县', '3', '340800', null, '1');
INSERT INTO AREA_INFO VALUES ('228', '340881', '桐城市', '3', '340800', null, '1');
INSERT INTO AREA_INFO VALUES ('229', '341000', '黄山市', '2', '340000', null, '1');
INSERT INTO AREA_INFO VALUES ('230', '341001', '市辖区', '3', '341000', null, '1');
INSERT INTO AREA_INFO VALUES ('231', '341002', '屯溪区', '3', '341000', null, '1');
INSERT INTO AREA_INFO VALUES ('232', '341003', '黄山区', '3', '341000', null, '1');
INSERT INTO AREA_INFO VALUES ('233', '341004', '徽州区', '3', '341000', null, '1');
INSERT INTO AREA_INFO VALUES ('234', '341021', '歙县', '3', '341000', null, '1');
INSERT INTO AREA_INFO VALUES ('235', '341022', '休宁县', '3', '341000', null, '1');
INSERT INTO AREA_INFO VALUES ('236', '341023', '黟县', '3', '341000', null, '1');
INSERT INTO AREA_INFO VALUES ('237', '341024', '祁门县', '3', '341000', null, '1');
INSERT INTO AREA_INFO VALUES ('238', '341100', '滁州市', '2', '340000', null, '1');
INSERT INTO AREA_INFO VALUES ('239', '341101', '市辖区', '3', '341100', null, '1');
INSERT INTO AREA_INFO VALUES ('240', '341102', '琅琊区', '3', '341100', null, '1');
INSERT INTO AREA_INFO VALUES ('241', '341103', '南谯区', '3', '341100', null, '1');
INSERT INTO AREA_INFO VALUES ('242', '341122', '来安县', '3', '341100', null, '1');
INSERT INTO AREA_INFO VALUES ('243', '341124', '全椒县', '3', '341100', null, '1');
INSERT INTO AREA_INFO VALUES ('244', '341125', '定远县', '3', '341100', null, '1');
INSERT INTO AREA_INFO VALUES ('245', '341126', '凤阳县', '3', '341100', null, '1');
INSERT INTO AREA_INFO VALUES ('246', '341622', '蒙城县', '3', '341600', null, '1');
INSERT INTO AREA_INFO VALUES ('247', '341623', '利辛县', '3', '341600', null, '1');
INSERT INTO AREA_INFO VALUES ('248', '341700', '池州市', '2', '340000', null, '1');
INSERT INTO AREA_INFO VALUES ('249', '341701', '市辖区', '3', '341700', null, '1');
INSERT INTO AREA_INFO VALUES ('250', '341702', '贵池区', '3', '341700', null, '1');
INSERT INTO AREA_INFO VALUES ('251', '411424', '柘城县', '3', '411400', null, '1');
INSERT INTO AREA_INFO VALUES ('252', '411425', '虞城县', '3', '411400', null, '1');
INSERT INTO AREA_INFO VALUES ('253', '411500', '信阳市', '2', '410000', null, '1');
INSERT INTO AREA_INFO VALUES ('254', '411501', '市辖区', '3', '411500', null, '1');
INSERT INTO AREA_INFO VALUES ('255', '411502', '浉河区', '3', '411500', null, '1');
INSERT INTO AREA_INFO VALUES ('256', '411503', '平桥区', '3', '411500', null, '1');
INSERT INTO AREA_INFO VALUES ('257', '411521', '罗山县', '3', '411500', null, '1');
INSERT INTO AREA_INFO VALUES ('258', '411522', '光山县', '3', '411500', null, '1');
INSERT INTO AREA_INFO VALUES ('259', '411523', '新县', '3', '411500', null, '1');
INSERT INTO AREA_INFO VALUES ('260', '411524', '商城县', '3', '411500', null, '1');
INSERT INTO AREA_INFO VALUES ('261', '411525', '固始县', '3', '411500', null, '1');
INSERT INTO AREA_INFO VALUES ('262', '411526', '潢川县', '3', '411500', null, '1');
INSERT INTO AREA_INFO VALUES ('263', '411527', '淮滨县', '3', '411500', null, '1');
INSERT INTO AREA_INFO VALUES ('264', '411528', '息县', '3', '411500', null, '1');
INSERT INTO AREA_INFO VALUES ('265', '411600', '周口市', '2', '410000', null, '1');
INSERT INTO AREA_INFO VALUES ('266', '411601', '市辖区', '3', '411600', null, '1');
INSERT INTO AREA_INFO VALUES ('267', '411602', '川汇区', '3', '411600', null, '1');
INSERT INTO AREA_INFO VALUES ('268', '411621', '扶沟县', '3', '411600', null, '1');
INSERT INTO AREA_INFO VALUES ('269', '450123', '隆安县', '3', '450100', null, '1');
INSERT INTO AREA_INFO VALUES ('270', '450124', '马山县', '3', '450100', null, '1');
INSERT INTO AREA_INFO VALUES ('271', '450125', '上林县', '3', '450100', null, '1');
INSERT INTO AREA_INFO VALUES ('272', '450126', '宾阳县', '3', '450100', null, '1');
INSERT INTO AREA_INFO VALUES ('273', '450127', '横县', '3', '450100', null, '1');
INSERT INTO AREA_INFO VALUES ('274', '450200', '柳州市', '2', '450000', null, '1');
INSERT INTO AREA_INFO VALUES ('275', '450201', '市辖区', '3', '450200', null, '1');
INSERT INTO AREA_INFO VALUES ('276', '450202', '城中区', '3', '450200', null, '1');
INSERT INTO AREA_INFO VALUES ('277', '450203', '鱼峰区', '3', '450200', null, '1');
INSERT INTO AREA_INFO VALUES ('278', '450204', '柳南区', '3', '450200', null, '1');
INSERT INTO AREA_INFO VALUES ('279', '450205', '柳北区', '3', '450200', null, '1');
INSERT INTO AREA_INFO VALUES ('280', '450221', '柳江县', '3', '450200', null, '1');
INSERT INTO AREA_INFO VALUES ('281', '450222', '柳城县', '3', '450200', null, '1');
INSERT INTO AREA_INFO VALUES ('282', '450223', '鹿寨县', '3', '450200', null, '1');
INSERT INTO AREA_INFO VALUES ('283', '450224', '融安县', '3', '450200', null, '1');
INSERT INTO AREA_INFO VALUES ('284', '450225', '融水苗族自治县', '3', '450200', null, '1');
INSERT INTO AREA_INFO VALUES ('285', '450226', '三江侗族自治县', '3', '450200', null, '1');
INSERT INTO AREA_INFO VALUES ('286', '450300', '桂林市', '2', '450000', null, '1');
INSERT INTO AREA_INFO VALUES ('287', '450301', '市辖区', '3', '450300', null, '1');
INSERT INTO AREA_INFO VALUES ('288', '450302', '秀峰区', '3', '450300', null, '1');
INSERT INTO AREA_INFO VALUES ('289', '450303', '叠彩区', '3', '450300', null, '1');
INSERT INTO AREA_INFO VALUES ('290', '450304', '象山区', '3', '450300', null, '1');
INSERT INTO AREA_INFO VALUES ('291', '450305', '七星区', '3', '450300', null, '1');
INSERT INTO AREA_INFO VALUES ('292', '450311', '雁山区', '3', '450300', null, '1');
INSERT INTO AREA_INFO VALUES ('293', '450321', '阳朔县', '3', '450300', null, '1');
INSERT INTO AREA_INFO VALUES ('294', '450322', '临桂县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('295', '450323', '灵川县', '3', '450300', null, '1');
INSERT INTO AREA_INFO VALUES ('296', '450324', '全州县', '3', '450300', null, '1');
INSERT INTO AREA_INFO VALUES ('297', '450325', '兴安县', '3', '450300', null, '1');
INSERT INTO AREA_INFO VALUES ('298', '450326', '永福县', '3', '450300', null, '1');
INSERT INTO AREA_INFO VALUES ('299', '450327', '灌阳县', '3', '450300', null, '1');
INSERT INTO AREA_INFO VALUES ('300', '450328', '龙胜各族自治县', '3', '450300', null, '1');
INSERT INTO AREA_INFO VALUES ('301', '450329', '资源县', '3', '450300', null, '1');
INSERT INTO AREA_INFO VALUES ('302', '450330', '平乐县', '3', '450300', null, '1');
INSERT INTO AREA_INFO VALUES ('303', '450331', '荔蒲县', '3', '450300', null, '1');
INSERT INTO AREA_INFO VALUES ('304', '450332', '恭城瑶族自治县', '3', '450300', null, '1');
INSERT INTO AREA_INFO VALUES ('305', '450400', '梧州市', '2', '450000', null, '1');
INSERT INTO AREA_INFO VALUES ('306', '450401', '市辖区', '3', '450400', null, '1');
INSERT INTO AREA_INFO VALUES ('307', '450403', '万秀区', '3', '450400', null, '1');
INSERT INTO AREA_INFO VALUES ('308', '450404', '蝶山区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('309', '450405', '长洲区', '3', '450400', null, '1');
INSERT INTO AREA_INFO VALUES ('310', '450421', '苍梧县', '3', '450400', null, '1');
INSERT INTO AREA_INFO VALUES ('311', '450422', '藤县', '3', '450400', null, '1');
INSERT INTO AREA_INFO VALUES ('312', '450423', '蒙山县', '3', '450400', null, '1');
INSERT INTO AREA_INFO VALUES ('313', '450481', '岑溪市', '3', '450400', null, '1');
INSERT INTO AREA_INFO VALUES ('314', '450500', '北海市', '2', '450000', null, '1');
INSERT INTO AREA_INFO VALUES ('315', '450501', '市辖区', '3', '450500', null, '1');
INSERT INTO AREA_INFO VALUES ('316', '450502', '海城区', '3', '450500', null, '1');
INSERT INTO AREA_INFO VALUES ('317', '450503', '银海区', '3', '450500', null, '1');
INSERT INTO AREA_INFO VALUES ('318', '450512', '铁山港区', '3', '450500', null, '1');
INSERT INTO AREA_INFO VALUES ('319', '450521', '合浦县', '3', '450500', null, '1');
INSERT INTO AREA_INFO VALUES ('320', '450600', '防城港市', '2', '450000', null, '1');
INSERT INTO AREA_INFO VALUES ('321', '450601', '市辖区', '3', '450600', null, '1');
INSERT INTO AREA_INFO VALUES ('322', '450602', '港口区', '3', '450600', null, '1');
INSERT INTO AREA_INFO VALUES ('323', '450603', '防城区', '3', '450600', null, '1');
INSERT INTO AREA_INFO VALUES ('324', '450621', '上思县', '3', '450600', null, '1');
INSERT INTO AREA_INFO VALUES ('325', '450681', '东兴市', '3', '450600', null, '1');
INSERT INTO AREA_INFO VALUES ('326', '450700', '钦州市', '2', '450000', null, '1');
INSERT INTO AREA_INFO VALUES ('327', '450701', '市辖区', '3', '450700', null, '1');
INSERT INTO AREA_INFO VALUES ('328', '460000', '海南省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('329', '460100', '海口市', '2', '460000', null, '1');
INSERT INTO AREA_INFO VALUES ('330', '460101', '市辖区', '3', '460100', null, '1');
INSERT INTO AREA_INFO VALUES ('331', '460107', '琼山区', '3', '460100', null, '1');
INSERT INTO AREA_INFO VALUES ('332', '460108', '美兰区', '3', '460100', null, '1');
INSERT INTO AREA_INFO VALUES ('333', '460200', '三亚市', '2', '460000', null, '1');
INSERT INTO AREA_INFO VALUES ('334', '460201', '市辖区', '3', '460200', null, '1');
INSERT INTO AREA_INFO VALUES ('335', '469000', '省直辖县级行政单位', '2', '460000', null, '1');
INSERT INTO AREA_INFO VALUES ('336', '469001', '五指山市', '3', '469000', null, '1');
INSERT INTO AREA_INFO VALUES ('337', '469002', '琼海市', '3', '469000', null, '1');
INSERT INTO AREA_INFO VALUES ('338', '469003', '儋州市', '3', '469000', null, '1');
INSERT INTO AREA_INFO VALUES ('339', '469005', '文昌市', '3', '469000', null, '1');
INSERT INTO AREA_INFO VALUES ('340', '469006', '万宁市', '3', '469000', null, '1');
INSERT INTO AREA_INFO VALUES ('341', '469007', '东方市', '3', '469000', null, '1');
INSERT INTO AREA_INFO VALUES ('342', '469025', '定安县', '3', '469000', null, '1');
INSERT INTO AREA_INFO VALUES ('343', '469026', '屯昌县', '3', '469000', null, '1');
INSERT INTO AREA_INFO VALUES ('344', '469027', '澄迈县', '3', '469000', null, '1');
INSERT INTO AREA_INFO VALUES ('345', '469028', '临高县', '3', '469000', null, '1');
INSERT INTO AREA_INFO VALUES ('346', '469030', '白沙黎族自治县', '3', '469000', null, '1');
INSERT INTO AREA_INFO VALUES ('347', '469031', '昌江黎族自治县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('348', '469033', '乐东黎族自治县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('349', '469034', '陵水黎族自治县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('350', '469035', '保亭黎族苗族自治县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('351', '469036', '琼中黎族苗族自治县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('352', '469037', '西沙群岛', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('353', '469038', '南沙群岛', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('354', '500000', '重庆市', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('355', '500100', '市辖区', '2', '500000', null, '1');
INSERT INTO AREA_INFO VALUES ('356', '500101', '万州区', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('357', '500102', '涪陵区', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('358', '500103', '渝中区', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('359', '500104', '大渡口区', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('360', '500105', '江北区', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('361', '500106', '沙坪坝区', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('362', '500107', '九龙坡区', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('363', '500108', '南岸区', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('364', '500109', '北碚区', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('365', '500110', '万盛区', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('366', '500111', '双桥区', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('367', '500112', '渝北区', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('368', '500113', '巴南区', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('369', '500115', '长寿区', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('370', '500116', '江津区', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('371', '500117', '合川区', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('372', '500118', '永川区', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('373', '500119', '南川区', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('374', '500200', '县', '2', '500000', null, '1');
INSERT INTO AREA_INFO VALUES ('375', '500222', '綦江县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('376', '500223', '潼南县', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('377', '500224', '铜梁县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('378', '500225', '大足县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('379', '500226', '荣昌县', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('380', '500235', '云阳县', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('381', '500236', '奉节县', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('382', '500237', '巫山县', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('383', '500238', '巫溪县', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('384', '500240', '石柱土家族自治县', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('385', '500241', '秀山土家族苗族自治县', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('386', '500242', '酉阳土家族苗族自治县', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('387', '510115', '温江区', '3', '510100', null, '1');
INSERT INTO AREA_INFO VALUES ('388', '510121', '金堂县', '3', '510100', null, '1');
INSERT INTO AREA_INFO VALUES ('389', '510124', '郫县', '3', '510100', null, '1');
INSERT INTO AREA_INFO VALUES ('390', '510129', '大邑县', '3', '510100', null, '1');
INSERT INTO AREA_INFO VALUES ('391', '510131', '蒲江县', '3', '510100', null, '1');
INSERT INTO AREA_INFO VALUES ('392', '510132', '新津县', '3', '510100', null, '1');
INSERT INTO AREA_INFO VALUES ('393', '510181', '都江堰市', '3', '510100', null, '1');
INSERT INTO AREA_INFO VALUES ('394', '510182', '彭州市', '3', '510100', null, '1');
INSERT INTO AREA_INFO VALUES ('395', '510183', '邛崃市', '3', '510100', null, '1');
INSERT INTO AREA_INFO VALUES ('396', '510184', '崇州市', '3', '510100', null, '1');
INSERT INTO AREA_INFO VALUES ('397', '510300', '自贡市', '2', '510000', null, '1');
INSERT INTO AREA_INFO VALUES ('398', '510301', '市辖区', '3', '510300', null, '1');
INSERT INTO AREA_INFO VALUES ('399', '510302', '自流井区', '3', '510300', null, '1');
INSERT INTO AREA_INFO VALUES ('400', '510303', '贡井区', '3', '510300', null, '1');
INSERT INTO AREA_INFO VALUES ('401', '510304', '大安区', '3', '510300', null, '1');
INSERT INTO AREA_INFO VALUES ('402', '510311', '沿滩区', '3', '510300', null, '1');
INSERT INTO AREA_INFO VALUES ('403', '510411', '仁和区', '3', '510400', null, '1');
INSERT INTO AREA_INFO VALUES ('404', '510421', '米易县', '3', '510400', null, '1');
INSERT INTO AREA_INFO VALUES ('405', '510422', '盐边县', '3', '510400', null, '1');
INSERT INTO AREA_INFO VALUES ('406', '510500', '泸州市', '2', '510000', null, '1');
INSERT INTO AREA_INFO VALUES ('407', '510501', '市辖区', '3', '510500', null, '1');
INSERT INTO AREA_INFO VALUES ('408', '510502', '江阳区', '3', '510500', null, '1');
INSERT INTO AREA_INFO VALUES ('409', '510503', '纳溪区', '3', '510500', null, '1');
INSERT INTO AREA_INFO VALUES ('410', '510504', '龙马潭区', '3', '510500', null, '1');
INSERT INTO AREA_INFO VALUES ('411', '510521', '泸县', '3', '510500', null, '1');
INSERT INTO AREA_INFO VALUES ('412', '510522', '合江县', '3', '510500', null, '1');
INSERT INTO AREA_INFO VALUES ('413', '510524', '叙永县', '3', '510500', null, '1');
INSERT INTO AREA_INFO VALUES ('414', '510525', '古蔺县', '3', '510500', null, '1');
INSERT INTO AREA_INFO VALUES ('415', '510600', '德阳市', '2', '510000', null, '1');
INSERT INTO AREA_INFO VALUES ('416', '510703', '涪城区', '3', '510700', null, '1');
INSERT INTO AREA_INFO VALUES ('417', '510725', '梓潼县', '3', '510700', null, '1');
INSERT INTO AREA_INFO VALUES ('418', '510726', '北川羌族自治县', '3', '510700', null, '1');
INSERT INTO AREA_INFO VALUES ('419', '510727', '平武县', '3', '510700', null, '1');
INSERT INTO AREA_INFO VALUES ('420', '510781', '江油市', '3', '510700', null, '1');
INSERT INTO AREA_INFO VALUES ('421', '510800', '广元市', '2', '510000', null, '1');
INSERT INTO AREA_INFO VALUES ('422', '510801', '市辖区', '3', '510800', null, '1');
INSERT INTO AREA_INFO VALUES ('423', '510802', '市中区', '3', '510800', null, '1');
INSERT INTO AREA_INFO VALUES ('424', '450702', '钦南区', '3', '450700', null, '1');
INSERT INTO AREA_INFO VALUES ('425', '450703', '钦北区', '3', '450700', null, '1');
INSERT INTO AREA_INFO VALUES ('426', '450721', '灵山县', '3', '450700', null, '1');
INSERT INTO AREA_INFO VALUES ('427', '450722', '浦北县', '3', '450700', null, '1');
INSERT INTO AREA_INFO VALUES ('428', '450800', '贵港市', '2', '450000', null, '1');
INSERT INTO AREA_INFO VALUES ('429', '450801', '市辖区', '3', '450800', null, '1');
INSERT INTO AREA_INFO VALUES ('430', '450802', '港北区', '3', '450800', null, '1');
INSERT INTO AREA_INFO VALUES ('431', '450803', '港南区', '3', '450800', null, '1');
INSERT INTO AREA_INFO VALUES ('432', '450804', '覃塘区', '3', '450800', null, '1');
INSERT INTO AREA_INFO VALUES ('433', '450821', '平南县', '3', '450800', null, '1');
INSERT INTO AREA_INFO VALUES ('434', '450881', '桂平市', '3', '450800', null, '1');
INSERT INTO AREA_INFO VALUES ('435', '450900', '玉林市', '2', '450000', null, '1');
INSERT INTO AREA_INFO VALUES ('436', '450901', '市辖区', '3', '450900', null, '1');
INSERT INTO AREA_INFO VALUES ('437', '450902', '玉州区', '3', '450900', null, '1');
INSERT INTO AREA_INFO VALUES ('438', '450921', '容县', '3', '450900', null, '1');
INSERT INTO AREA_INFO VALUES ('439', '450922', '陆川县', '3', '450900', null, '1');
INSERT INTO AREA_INFO VALUES ('440', '450923', '博白县', '3', '450900', null, '1');
INSERT INTO AREA_INFO VALUES ('441', '450924', '兴业县', '3', '450900', null, '1');
INSERT INTO AREA_INFO VALUES ('442', '450981', '北流市', '3', '450900', null, '1');
INSERT INTO AREA_INFO VALUES ('443', '451000', '百色市', '2', '450000', null, '1');
INSERT INTO AREA_INFO VALUES ('444', '451001', '市辖区', '3', '451000', null, '1');
INSERT INTO AREA_INFO VALUES ('445', '451002', '右江区', '3', '451000', null, '1');
INSERT INTO AREA_INFO VALUES ('446', '451021', '田阳县', '3', '451000', null, '1');
INSERT INTO AREA_INFO VALUES ('447', '451022', '田东县', '3', '451000', null, '1');
INSERT INTO AREA_INFO VALUES ('448', '451023', '平果县', '3', '451000', null, '1');
INSERT INTO AREA_INFO VALUES ('449', '451024', '德保县', '3', '451000', null, '1');
INSERT INTO AREA_INFO VALUES ('450', '451025', '靖西县', '3', '451000', null, '1');
INSERT INTO AREA_INFO VALUES ('451', '451026', '那坡县', '3', '451000', null, '1');
INSERT INTO AREA_INFO VALUES ('452', '451027', '凌云县', '3', '451000', null, '1');
INSERT INTO AREA_INFO VALUES ('453', '451028', '乐业县', '3', '451000', null, '1');
INSERT INTO AREA_INFO VALUES ('454', '511302', '顺庆区', '3', '511300', null, '1');
INSERT INTO AREA_INFO VALUES ('455', '511303', '高坪区', '3', '511300', null, '1');
INSERT INTO AREA_INFO VALUES ('456', '511304', '嘉陵区', '3', '511300', null, '1');
INSERT INTO AREA_INFO VALUES ('457', '511321', '南部县', '3', '511300', null, '1');
INSERT INTO AREA_INFO VALUES ('458', '511322', '营山县', '3', '511300', null, '1');
INSERT INTO AREA_INFO VALUES ('459', '511323', '蓬安县', '3', '511300', null, '1');
INSERT INTO AREA_INFO VALUES ('460', '511324', '仪陇县', '3', '511300', null, '1');
INSERT INTO AREA_INFO VALUES ('461', '511325', '西充县', '3', '511300', null, '1');
INSERT INTO AREA_INFO VALUES ('462', '511381', '阆中市', '3', '511300', null, '1');
INSERT INTO AREA_INFO VALUES ('463', '511400', '眉山市', '2', '510000', null, '1');
INSERT INTO AREA_INFO VALUES ('464', '511529', '屏山县', '3', '511500', null, '1');
INSERT INTO AREA_INFO VALUES ('465', '511600', '广安市', '2', '510000', null, '1');
INSERT INTO AREA_INFO VALUES ('466', '511601', '市辖区', '3', '511600', null, '1');
INSERT INTO AREA_INFO VALUES ('467', '511602', '广安区', '3', '511600', null, '1');
INSERT INTO AREA_INFO VALUES ('468', '511621', '岳池县', '3', '511600', null, '1');
INSERT INTO AREA_INFO VALUES ('469', '511622', '武胜县', '3', '511600', null, '1');
INSERT INTO AREA_INFO VALUES ('470', '511900', '巴中市', '2', '510000', null, '1');
INSERT INTO AREA_INFO VALUES ('471', '511901', '市辖区', '3', '511900', null, '1');
INSERT INTO AREA_INFO VALUES ('472', '511902', '巴州区', '3', '511900', null, '1');
INSERT INTO AREA_INFO VALUES ('473', '511921', '通江县', '3', '511900', null, '1');
INSERT INTO AREA_INFO VALUES ('474', '511922', '南江县', '3', '511900', null, '1');
INSERT INTO AREA_INFO VALUES ('475', '511923', '平昌县', '3', '511900', null, '1');
INSERT INTO AREA_INFO VALUES ('476', '512000', '资阳市', '2', '510000', null, '1');
INSERT INTO AREA_INFO VALUES ('477', '512001', '市辖区', '3', '512000', null, '1');
INSERT INTO AREA_INFO VALUES ('478', '512002', '雁江区', '3', '512000', null, '1');
INSERT INTO AREA_INFO VALUES ('479', '512021', '安岳县', '3', '512000', null, '1');
INSERT INTO AREA_INFO VALUES ('480', '512022', '乐至县', '3', '512000', null, '1');
INSERT INTO AREA_INFO VALUES ('481', '512081', '简阳市', '3', '512000', null, '1');
INSERT INTO AREA_INFO VALUES ('482', '513200', '阿坝藏族羌族自治州', '2', '510000', null, '1');
INSERT INTO AREA_INFO VALUES ('483', '513221', '汶川县', '3', '513200', null, '1');
INSERT INTO AREA_INFO VALUES ('484', '513222', '理县', '3', '513200', null, '1');
INSERT INTO AREA_INFO VALUES ('485', '513223', '茂县', '3', '513200', null, '1');
INSERT INTO AREA_INFO VALUES ('486', '513224', '松潘县', '3', '513200', null, '1');
INSERT INTO AREA_INFO VALUES ('487', '513225', '九寨沟县', '3', '513200', null, '1');
INSERT INTO AREA_INFO VALUES ('488', '513226', '金川县', '3', '513200', null, '1');
INSERT INTO AREA_INFO VALUES ('489', '513227', '小金县', '3', '513200', null, '1');
INSERT INTO AREA_INFO VALUES ('490', '513228', '黑水县', '3', '513200', null, '1');
INSERT INTO AREA_INFO VALUES ('491', '120116', '滨海新区', '3', '120100', null, '1');
INSERT INTO AREA_INFO VALUES ('492', '441421', '梅县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('493', '441422', '大埔县', '3', '441400', null, '1');
INSERT INTO AREA_INFO VALUES ('494', '441423', '丰顺县', '3', '441400', null, '1');
INSERT INTO AREA_INFO VALUES ('495', '441424', '五华县', '3', '441400', null, '1');
INSERT INTO AREA_INFO VALUES ('496', '441426', '平远县', '3', '441400', null, '1');
INSERT INTO AREA_INFO VALUES ('497', '441427', '蕉岭县', '3', '441400', null, '1');
INSERT INTO AREA_INFO VALUES ('498', '441481', '兴宁市', '3', '441400', null, '1');
INSERT INTO AREA_INFO VALUES ('499', '441500', '汕尾市', '2', '440000', null, '1');
INSERT INTO AREA_INFO VALUES ('500', '350201', '市辖区', '3', '350200', null, '1');
INSERT INTO AREA_INFO VALUES ('501', '350203', '思明区', '3', '350200', null, '1');
INSERT INTO AREA_INFO VALUES ('502', '350205', '海沧区', '3', '350200', null, '1');
INSERT INTO AREA_INFO VALUES ('503', '350206', '湖里区', '3', '350200', null, '1');
INSERT INTO AREA_INFO VALUES ('504', '350211', '集美区', '3', '350200', null, '1');
INSERT INTO AREA_INFO VALUES ('505', '350212', '同安区', '3', '350200', null, '1');
INSERT INTO AREA_INFO VALUES ('506', '350213', '翔安区', '3', '350200', null, '1');
INSERT INTO AREA_INFO VALUES ('507', '350300', '莆田市', '2', '350000', null, '1');
INSERT INTO AREA_INFO VALUES ('508', '350301', '市辖区', '3', '350300', null, '1');
INSERT INTO AREA_INFO VALUES ('509', '350302', '城厢区', '3', '350300', null, '1');
INSERT INTO AREA_INFO VALUES ('510', '350401', '市辖区', '3', '350400', null, '1');
INSERT INTO AREA_INFO VALUES ('511', '350402', '梅列区', '3', '350400', null, '1');
INSERT INTO AREA_INFO VALUES ('512', '350403', '三元区', '3', '350400', null, '1');
INSERT INTO AREA_INFO VALUES ('513', '350421', '明溪县', '3', '350400', null, '1');
INSERT INTO AREA_INFO VALUES ('514', '350423', '清流县', '3', '350400', null, '1');
INSERT INTO AREA_INFO VALUES ('515', '350424', '宁化县', '3', '350400', null, '1');
INSERT INTO AREA_INFO VALUES ('516', '350425', '大田县', '3', '350400', null, '1');
INSERT INTO AREA_INFO VALUES ('517', '350426', '尤溪县', '3', '350400', null, '1');
INSERT INTO AREA_INFO VALUES ('518', '350427', '沙县', '3', '350400', null, '1');
INSERT INTO AREA_INFO VALUES ('519', '350428', '将乐县', '3', '350400', null, '1');
INSERT INTO AREA_INFO VALUES ('520', '350429', '泰宁县', '3', '350400', null, '1');
INSERT INTO AREA_INFO VALUES ('521', '350430', '建宁县', '3', '350400', null, '1');
INSERT INTO AREA_INFO VALUES ('522', '350481', '永安市', '3', '350400', null, '1');
INSERT INTO AREA_INFO VALUES ('523', '350500', '泉州市', '2', '350000', null, '1');
INSERT INTO AREA_INFO VALUES ('524', '370983', '肥城市', '3', '370900', null, '1');
INSERT INTO AREA_INFO VALUES ('525', '371000', '威海市', '2', '370000', null, '1');
INSERT INTO AREA_INFO VALUES ('526', '371001', '市辖区', '3', '371000', null, '1');
INSERT INTO AREA_INFO VALUES ('527', '371002', '环翠区', '3', '371000', null, '1');
INSERT INTO AREA_INFO VALUES ('528', '371081', '文登市', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('529', '371082', '荣成市', '3', '371000', null, '1');
INSERT INTO AREA_INFO VALUES ('530', '371424', '临邑县', '3', '371400', null, '1');
INSERT INTO AREA_INFO VALUES ('531', '371425', '齐河县', '3', '371400', null, '1');
INSERT INTO AREA_INFO VALUES ('532', '371426', '平原县', '3', '371400', null, '1');
INSERT INTO AREA_INFO VALUES ('533', '371427', '夏津县', '3', '371400', null, '1');
INSERT INTO AREA_INFO VALUES ('534', '371428', '武城县', '3', '371400', null, '1');
INSERT INTO AREA_INFO VALUES ('535', '371481', '乐陵市', '3', '371400', null, '1');
INSERT INTO AREA_INFO VALUES ('536', '371482', '禹城市', '3', '371400', null, '1');
INSERT INTO AREA_INFO VALUES ('537', '371500', '聊城市', '2', '370000', null, '1');
INSERT INTO AREA_INFO VALUES ('538', '371626', '邹平县', '3', '371600', null, '1');
INSERT INTO AREA_INFO VALUES ('539', '371700', '菏泽市', '2', '370000', null, '1');
INSERT INTO AREA_INFO VALUES ('540', '371701', '市辖区', '3', '371700', null, '1');
INSERT INTO AREA_INFO VALUES ('541', '371702', '牡丹区', '3', '371700', null, '1');
INSERT INTO AREA_INFO VALUES ('542', '371721', '曹县', '3', '371700', null, '1');
INSERT INTO AREA_INFO VALUES ('543', '371722', '单县', '3', '371700', null, '1');
INSERT INTO AREA_INFO VALUES ('544', '371723', '成武县', '3', '371700', null, '1');
INSERT INTO AREA_INFO VALUES ('545', '410222', '通许县', '3', '410200', null, '1');
INSERT INTO AREA_INFO VALUES ('546', '410223', '尉氏县', '3', '410200', null, '1');
INSERT INTO AREA_INFO VALUES ('547', '410224', '开封县', '3', '410200', null, '1');
INSERT INTO AREA_INFO VALUES ('548', '410225', '兰考县', '3', '410200', null, '1');
INSERT INTO AREA_INFO VALUES ('549', '410300', '洛阳市', '2', '410000', null, '1');
INSERT INTO AREA_INFO VALUES ('550', '410301', '市辖区', '3', '410300', null, '1');
INSERT INTO AREA_INFO VALUES ('551', '410302', '老城区', '3', '410300', null, '1');
INSERT INTO AREA_INFO VALUES ('552', '410303', '西工区', '3', '410300', null, '1');
INSERT INTO AREA_INFO VALUES ('553', '410304', '廛河回族区', '3', '410300', null, '1');
INSERT INTO AREA_INFO VALUES ('554', '410326', '汝阳县', '3', '410300', null, '1');
INSERT INTO AREA_INFO VALUES ('555', '410327', '宜阳县', '3', '410300', null, '1');
INSERT INTO AREA_INFO VALUES ('556', '410328', '洛宁县', '3', '410300', null, '1');
INSERT INTO AREA_INFO VALUES ('557', '410329', '伊川县', '3', '410300', null, '1');
INSERT INTO AREA_INFO VALUES ('558', '410381', '偃师市', '3', '410300', null, '1');
INSERT INTO AREA_INFO VALUES ('559', '410400', '平顶山市', '2', '410000', null, '1');
INSERT INTO AREA_INFO VALUES ('560', '410401', '市辖区', '3', '410400', null, '1');
INSERT INTO AREA_INFO VALUES ('561', '410402', '新华区', '3', '410400', null, '1');
INSERT INTO AREA_INFO VALUES ('562', '410403', '卫东区', '3', '410400', null, '1');
INSERT INTO AREA_INFO VALUES ('563', '410404', '石龙区', '3', '410400', null, '1');
INSERT INTO AREA_INFO VALUES ('564', '410411', '湛河区', '3', '410400', null, '1');
INSERT INTO AREA_INFO VALUES ('565', '410421', '宝丰县', '3', '410400', null, '1');
INSERT INTO AREA_INFO VALUES ('566', '410422', '叶县', '3', '410400', null, '1');
INSERT INTO AREA_INFO VALUES ('567', '410423', '鲁山县', '3', '410400', null, '1');
INSERT INTO AREA_INFO VALUES ('568', '410425', '郏县', '3', '410400', null, '1');
INSERT INTO AREA_INFO VALUES ('569', '410481', '舞钢市', '3', '410400', null, '1');
INSERT INTO AREA_INFO VALUES ('570', '410482', '汝州市', '3', '410400', null, '1');
INSERT INTO AREA_INFO VALUES ('571', '410500', '安阳市', '2', '410000', null, '1');
INSERT INTO AREA_INFO VALUES ('572', '410501', '市辖区', '3', '410500', null, '1');
INSERT INTO AREA_INFO VALUES ('573', '410502', '文峰区', '3', '410500', null, '1');
INSERT INTO AREA_INFO VALUES ('574', '410503', '北关区', '3', '410500', null, '1');
INSERT INTO AREA_INFO VALUES ('575', '410505', '殷都区', '3', '410500', null, '1');
INSERT INTO AREA_INFO VALUES ('576', '410506', '龙安区', '3', '410500', null, '1');
INSERT INTO AREA_INFO VALUES ('577', '410522', '安阳县', '3', '410500', null, '1');
INSERT INTO AREA_INFO VALUES ('578', '410523', '汤阴县', '3', '410500', null, '1');
INSERT INTO AREA_INFO VALUES ('579', '410526', '滑县', '3', '410500', null, '1');
INSERT INTO AREA_INFO VALUES ('580', '410527', '内黄县', '3', '410500', null, '1');
INSERT INTO AREA_INFO VALUES ('581', '410581', '林州市', '3', '410500', null, '1');
INSERT INTO AREA_INFO VALUES ('582', '410600', '鹤壁市', '2', '410000', null, '1');
INSERT INTO AREA_INFO VALUES ('583', '410601', '市辖区', '3', '410600', null, '1');
INSERT INTO AREA_INFO VALUES ('584', '410602', '鹤山区', '3', '410600', null, '1');
INSERT INTO AREA_INFO VALUES ('585', '410603', '山城区', '3', '410600', null, '1');
INSERT INTO AREA_INFO VALUES ('586', '410611', '淇滨区', '3', '410600', null, '1');
INSERT INTO AREA_INFO VALUES ('587', '410621', '浚县', '3', '410600', null, '1');
INSERT INTO AREA_INFO VALUES ('588', '410622', '淇县', '3', '410600', null, '1');
INSERT INTO AREA_INFO VALUES ('1030', '441781', '阳春市', '3', '441700', null, '1');
INSERT INTO AREA_INFO VALUES ('1031', '441800', '清远市', '2', '440000', null, '1');
INSERT INTO AREA_INFO VALUES ('1032', '441801', '市辖区', '3', '441800', null, '1');
INSERT INTO AREA_INFO VALUES ('1033', '441802', '清城区', '3', '441800', null, '1');
INSERT INTO AREA_INFO VALUES ('1034', '441821', '佛冈县', '3', '441800', null, '1');
INSERT INTO AREA_INFO VALUES ('1035', '441823', '阳山县', '3', '441800', null, '1');
INSERT INTO AREA_INFO VALUES ('1036', '441825', '连山壮族瑶族自治县', '3', '441800', null, '1');
INSERT INTO AREA_INFO VALUES ('1037', '441826', '连南瑶族自治县', '3', '441800', null, '1');
INSERT INTO AREA_INFO VALUES ('1038', '441827', '清新县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1039', '441881', '英德市', '3', '441800', null, '1');
INSERT INTO AREA_INFO VALUES ('1040', '441882', '连州市', '3', '441800', null, '1');
INSERT INTO AREA_INFO VALUES ('1041', '411001', '市辖区', '3', '411000', null, '1');
INSERT INTO AREA_INFO VALUES ('1042', '441900', '东莞市', '2', '440000', null, '1');
INSERT INTO AREA_INFO VALUES ('1043', '441901', '东莞市市辖区', '3', '441900', null, '1');
INSERT INTO AREA_INFO VALUES ('1044', '442000', '中山市', '2', '440000', null, '1');
INSERT INTO AREA_INFO VALUES ('1045', '442001', '中山市市辖区', '3', '442000', null, '1');
INSERT INTO AREA_INFO VALUES ('1046', '442101', '市区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1047', '445100', '潮州市', '2', '440000', null, '1');
INSERT INTO AREA_INFO VALUES ('1048', '445101', '市辖区', '3', '445100', null, '1');
INSERT INTO AREA_INFO VALUES ('1049', '445102', '湘桥区', '3', '445100', null, '1');
INSERT INTO AREA_INFO VALUES ('1050', '445121', '潮安县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1051', '445122', '饶平县', '3', '445100', null, '1');
INSERT INTO AREA_INFO VALUES ('1052', '445200', '揭阳市', '2', '440000', null, '1');
INSERT INTO AREA_INFO VALUES ('1053', '445201', '市辖区', '3', '445200', null, '1');
INSERT INTO AREA_INFO VALUES ('1054', '445202', '榕城区', '3', '445200', null, '1');
INSERT INTO AREA_INFO VALUES ('1055', '445221', '揭东县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1056', '445222', '揭西县', '3', '445200', null, '1');
INSERT INTO AREA_INFO VALUES ('1057', '445224', '惠来县', '3', '445200', null, '1');
INSERT INTO AREA_INFO VALUES ('1058', '445281', '普宁市', '3', '445200', null, '1');
INSERT INTO AREA_INFO VALUES ('1059', '445300', '云浮市', '2', '440000', null, '1');
INSERT INTO AREA_INFO VALUES ('1060', '445301', '市辖区', '3', '445300', null, '1');
INSERT INTO AREA_INFO VALUES ('1061', '445302', '云城区', '3', '445300', null, '1');
INSERT INTO AREA_INFO VALUES ('1062', '445321', '新兴县', '3', '445300', null, '1');
INSERT INTO AREA_INFO VALUES ('1063', '445322', '郁南县', '3', '445300', null, '1');
INSERT INTO AREA_INFO VALUES ('1064', '445323', '云安县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1065', '445381', '罗定市', '3', '445300', null, '1');
INSERT INTO AREA_INFO VALUES ('1066', '450000', '广西壮族自治区', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('1067', '450100', '南宁市', '2', '450000', null, '1');
INSERT INTO AREA_INFO VALUES ('1068', '450101', '市辖区', '3', '450100', null, '1');
INSERT INTO AREA_INFO VALUES ('1069', '450102', '兴宁区', '3', '450100', null, '1');
INSERT INTO AREA_INFO VALUES ('1070', '450103', '青秀区', '3', '450100', null, '1');
INSERT INTO AREA_INFO VALUES ('1071', '450105', '江南区', '3', '450100', null, '1');
INSERT INTO AREA_INFO VALUES ('1072', '450107', '西乡塘区', '3', '450100', null, '1');
INSERT INTO AREA_INFO VALUES ('1073', '450108', '良庆区', '3', '450100', null, '1');
INSERT INTO AREA_INFO VALUES ('1074', '450109', '邕宁区', '3', '450100', null, '1');
INSERT INTO AREA_INFO VALUES ('1075', '450122', '武鸣县', '3', '450100', null, '1');
INSERT INTO AREA_INFO VALUES ('1076', '532600', '文山壮族苗族自治州', '2', '530000', null, '1');
INSERT INTO AREA_INFO VALUES ('1077', '532621', '文山县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1078', '532622', '砚山县', '3', '532600', null, '1');
INSERT INTO AREA_INFO VALUES ('1079', '533102', '瑞丽市', '3', '533100', null, '1');
INSERT INTO AREA_INFO VALUES ('1080', '533103', '潞西市', '3', '533100', null, '1');
INSERT INTO AREA_INFO VALUES ('1081', '533122', '梁河县', '3', '533100', null, '1');
INSERT INTO AREA_INFO VALUES ('1082', '533123', '盈江县', '3', '533100', null, '1');
INSERT INTO AREA_INFO VALUES ('1083', '533124', '陇川县', '3', '533100', null, '1');
INSERT INTO AREA_INFO VALUES ('1084', '533300', '怒江傈僳族自治州', '2', '530000', null, '1');
INSERT INTO AREA_INFO VALUES ('1085', '533321', '泸水县', '3', '533300', null, '1');
INSERT INTO AREA_INFO VALUES ('1086', '533323', '福贡县', '3', '533300', null, '1');
INSERT INTO AREA_INFO VALUES ('1087', '533324', '贡山独龙族怒族自治县', '3', '533300', null, '1');
INSERT INTO AREA_INFO VALUES ('1088', '533325', '兰坪白族普米族自治县', '3', '533300', null, '1');
INSERT INTO AREA_INFO VALUES ('1089', '533400', '迪庆藏族自治州', '2', '530000', null, '1');
INSERT INTO AREA_INFO VALUES ('1090', '533421', '香格里拉县', '3', '533400', null, '1');
INSERT INTO AREA_INFO VALUES ('1091', '533422', '德钦县', '3', '533400', null, '1');
INSERT INTO AREA_INFO VALUES ('1092', '533423', '维西傈僳族自治县', '3', '533400', null, '1');
INSERT INTO AREA_INFO VALUES ('1093', '350121', '闽侯县', '3', '350100', null, '1');
INSERT INTO AREA_INFO VALUES ('1094', '350122', '连江县', '3', '350100', null, '1');
INSERT INTO AREA_INFO VALUES ('1095', '360424', '修水县', '3', '360400', null, '1');
INSERT INTO AREA_INFO VALUES ('1096', '410882', '沁阳市', '3', '410800', null, '1');
INSERT INTO AREA_INFO VALUES ('1097', '410902', '华龙区', '3', '410900', null, '1');
INSERT INTO AREA_INFO VALUES ('1098', '419001', '市辖区', '3', '419000', null, '1');
INSERT INTO AREA_INFO VALUES ('1099', '430901', '市辖区', '3', '430900', null, '1');
INSERT INTO AREA_INFO VALUES ('1100', '430902', '资阳区', '3', '430900', null, '1');
INSERT INTO AREA_INFO VALUES ('1101', '430903', '赫山区', '3', '430900', null, '1');
INSERT INTO AREA_INFO VALUES ('1102', '430921', '南县', '3', '430900', null, '1');
INSERT INTO AREA_INFO VALUES ('1103', '430922', '桃江县', '3', '430900', null, '1');
INSERT INTO AREA_INFO VALUES ('1104', '430923', '安化县', '3', '430900', null, '1');
INSERT INTO AREA_INFO VALUES ('1105', '430981', '沅江市', '3', '430900', null, '1');
INSERT INTO AREA_INFO VALUES ('1106', '431000', '郴州市', '2', '430000', null, '1');
INSERT INTO AREA_INFO VALUES ('1107', '431001', '市辖区', '3', '431000', null, '1');
INSERT INTO AREA_INFO VALUES ('1108', '431002', '北湖区', '3', '431000', null, '1');
INSERT INTO AREA_INFO VALUES ('1109', '431003', '苏仙区', '3', '431000', null, '1');
INSERT INTO AREA_INFO VALUES ('1110', '431026', '汝城县', '3', '431000', null, '1');
INSERT INTO AREA_INFO VALUES ('1111', '431027', '桂东县', '3', '431000', null, '1');
INSERT INTO AREA_INFO VALUES ('1112', '431028', '安仁县', '3', '431000', null, '1');
INSERT INTO AREA_INFO VALUES ('1113', '431081', '资兴市', '3', '431000', null, '1');
INSERT INTO AREA_INFO VALUES ('1114', '431100', '永州市', '2', '430000', null, '1');
INSERT INTO AREA_INFO VALUES ('1115', '431101', '市辖区', '3', '431100', null, '1');
INSERT INTO AREA_INFO VALUES ('1116', '431102', '零陵区', '3', '431100', null, '1');
INSERT INTO AREA_INFO VALUES ('1117', '511402', '东坡区', '3', '511400', null, '1');
INSERT INTO AREA_INFO VALUES ('1118', '511421', '仁寿县', '3', '511400', null, '1');
INSERT INTO AREA_INFO VALUES ('1119', '511422', '彭山县', '3', '511400', null, '1');
INSERT INTO AREA_INFO VALUES ('1120', '532531', '绿春县', '3', '532500', null, '1');
INSERT INTO AREA_INFO VALUES ('1121', '542226', '曲松县', '3', '542200', null, '1');
INSERT INTO AREA_INFO VALUES ('1122', '632100', '海东地区', '2', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1123', '632121', '平安县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1124', '140721', '榆社县', '3', '140700', null, '1');
INSERT INTO AREA_INFO VALUES ('1125', '140722', '左权县', '3', '140700', null, '1');
INSERT INTO AREA_INFO VALUES ('1126', '140723', '和顺县', '3', '140700', null, '1');
INSERT INTO AREA_INFO VALUES ('1127', '140724', '昔阳县', '3', '140700', null, '1');
INSERT INTO AREA_INFO VALUES ('1128', '140725', '寿阳县', '3', '140700', null, '1');
INSERT INTO AREA_INFO VALUES ('1129', '140726', '太谷县', '3', '140700', null, '1');
INSERT INTO AREA_INFO VALUES ('1130', '140727', '祁县', '3', '140700', null, '1');
INSERT INTO AREA_INFO VALUES ('1131', '140728', '平遥县', '3', '140700', null, '1');
INSERT INTO AREA_INFO VALUES ('1132', '140729', '灵石县', '3', '140700', null, '1');
INSERT INTO AREA_INFO VALUES ('1133', '140781', '介休市', '3', '140700', null, '1');
INSERT INTO AREA_INFO VALUES ('1134', '140800', '运城市', '2', '140000', null, '1');
INSERT INTO AREA_INFO VALUES ('1135', '140801', '市辖区', '3', '140800', null, '1');
INSERT INTO AREA_INFO VALUES ('1136', '140802', '盐湖区', '3', '140800', null, '1');
INSERT INTO AREA_INFO VALUES ('1137', '140821', '临猗县', '3', '140800', null, '1');
INSERT INTO AREA_INFO VALUES ('1138', '140822', '万荣县', '3', '140800', null, '1');
INSERT INTO AREA_INFO VALUES ('1139', '140823', '闻喜县', '3', '140800', null, '1');
INSERT INTO AREA_INFO VALUES ('1140', '140824', '稷山县', '3', '140800', null, '1');
INSERT INTO AREA_INFO VALUES ('1141', '140825', '新绛县', '3', '140800', null, '1');
INSERT INTO AREA_INFO VALUES ('1142', '210703', '凌河区', '3', '210700', null, '1');
INSERT INTO AREA_INFO VALUES ('1143', '210711', '太和区', '3', '210700', null, '1');
INSERT INTO AREA_INFO VALUES ('1144', '210726', '黑山县', '3', '210700', null, '1');
INSERT INTO AREA_INFO VALUES ('1145', '210727', '义县', '3', '210700', null, '1');
INSERT INTO AREA_INFO VALUES ('1146', '210781', '凌海市', '3', '210700', null, '1');
INSERT INTO AREA_INFO VALUES ('1147', '210782', '北镇市', '3', '210700', null, '1');
INSERT INTO AREA_INFO VALUES ('1148', '210800', '营口市', '2', '210000', null, '1');
INSERT INTO AREA_INFO VALUES ('1149', '210801', '市辖区', '3', '210800', null, '1');
INSERT INTO AREA_INFO VALUES ('1150', '210802', '站前区', '3', '210800', null, '1');
INSERT INTO AREA_INFO VALUES ('1151', '210803', '西市区', '3', '210800', null, '1');
INSERT INTO AREA_INFO VALUES ('1152', '210804', '鲅鱼圈区', '3', '210800', null, '1');
INSERT INTO AREA_INFO VALUES ('1153', '210811', '老边区', '3', '210800', null, '1');
INSERT INTO AREA_INFO VALUES ('1154', '210881', '盖州市', '3', '210800', null, '1');
INSERT INTO AREA_INFO VALUES ('1155', '210900', '阜新市', '2', '210000', null, '1');
INSERT INTO AREA_INFO VALUES ('1156', '210901', '市辖区', '3', '210900', null, '1');
INSERT INTO AREA_INFO VALUES ('1157', '210902', '海州区', '3', '210900', null, '1');
INSERT INTO AREA_INFO VALUES ('1158', '210903', '新邱区', '3', '210900', null, '1');
INSERT INTO AREA_INFO VALUES ('1159', '210904', '太平区', '3', '210900', null, '1');
INSERT INTO AREA_INFO VALUES ('1160', '210905', '清河门区', '3', '210900', null, '1');
INSERT INTO AREA_INFO VALUES ('1161', '210911', '细河区', '3', '210900', null, '1');
INSERT INTO AREA_INFO VALUES ('1162', '210921', '阜新蒙古族自治县', '3', '210900', null, '1');
INSERT INTO AREA_INFO VALUES ('1163', '210922', '彰武县', '3', '210900', null, '1');
INSERT INTO AREA_INFO VALUES ('1164', '211000', '辽阳市', '2', '210000', null, '1');
INSERT INTO AREA_INFO VALUES ('1165', '211001', '市辖区', '3', '211000', null, '1');
INSERT INTO AREA_INFO VALUES ('1166', '211002', '白塔区', '3', '211000', null, '1');
INSERT INTO AREA_INFO VALUES ('1167', '211003', '文圣区', '3', '211000', null, '1');
INSERT INTO AREA_INFO VALUES ('1168', '211004', '宏伟区', '3', '211000', null, '1');
INSERT INTO AREA_INFO VALUES ('1169', '211005', '弓长岭区', '3', '211000', null, '1');
INSERT INTO AREA_INFO VALUES ('1170', '211011', '太子河区', '3', '211000', null, '1');
INSERT INTO AREA_INFO VALUES ('1171', '211021', '辽阳县', '3', '211000', null, '1');
INSERT INTO AREA_INFO VALUES ('1172', '211081', '灯塔市', '3', '211000', null, '1');
INSERT INTO AREA_INFO VALUES ('1173', '211100', '盘锦市', '2', '210000', null, '1');
INSERT INTO AREA_INFO VALUES ('1174', '211101', '市辖区', '3', '211100', null, '1');
INSERT INTO AREA_INFO VALUES ('1175', '211102', '双台子区', '3', '211100', null, '1');
INSERT INTO AREA_INFO VALUES ('1176', '211103', '兴隆台区', '3', '211100', null, '1');
INSERT INTO AREA_INFO VALUES ('1177', '211121', '大洼县', '3', '211100', null, '1');
INSERT INTO AREA_INFO VALUES ('1327', '371521', '阳谷县', '3', '371500', null, '1');
INSERT INTO AREA_INFO VALUES ('1328', '371522', '莘县', '3', '371500', null, '1');
INSERT INTO AREA_INFO VALUES ('1329', '371523', '茌平县', '3', '371500', null, '1');
INSERT INTO AREA_INFO VALUES ('1330', '371524', '东阿县', '3', '371500', null, '1');
INSERT INTO AREA_INFO VALUES ('1331', '371525', '冠县', '3', '371500', null, '1');
INSERT INTO AREA_INFO VALUES ('1332', '371526', '高唐县', '3', '371500', null, '1');
INSERT INTO AREA_INFO VALUES ('1333', '371581', '临清市', '3', '371500', null, '1');
INSERT INTO AREA_INFO VALUES ('1334', '371600', '滨州市', '2', '370000', null, '1');
INSERT INTO AREA_INFO VALUES ('1335', '371601', '市辖区', '3', '371600', null, '1');
INSERT INTO AREA_INFO VALUES ('1336', '371602', '滨城区', '3', '371600', null, '1');
INSERT INTO AREA_INFO VALUES ('1337', '371621', '惠民县', '3', '371600', null, '1');
INSERT INTO AREA_INFO VALUES ('1338', '371622', '阳信县', '3', '371600', null, '1');
INSERT INTO AREA_INFO VALUES ('1339', '371623', '无棣县', '3', '371600', null, '1');
INSERT INTO AREA_INFO VALUES ('1340', '371624', '沾化县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1341', '371625', '博兴县', '3', '371600', null, '1');
INSERT INTO AREA_INFO VALUES ('1342', '371724', '巨野县', '3', '371700', null, '1');
INSERT INTO AREA_INFO VALUES ('1343', '371725', '郓城县', '3', '371700', null, '1');
INSERT INTO AREA_INFO VALUES ('1344', '371726', '鄄城县', '3', '371700', null, '1');
INSERT INTO AREA_INFO VALUES ('1345', '371727', '定陶县', '3', '371700', null, '1');
INSERT INTO AREA_INFO VALUES ('1346', '371728', '东明县', '3', '371700', null, '1');
INSERT INTO AREA_INFO VALUES ('1347', '410000', '河南省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('1348', '410100', '郑州市', '2', '410000', null, '1');
INSERT INTO AREA_INFO VALUES ('1349', '410101', '市辖区', '3', '410100', null, '1');
INSERT INTO AREA_INFO VALUES ('1350', '410102', '中原区', '3', '410100', null, '1');
INSERT INTO AREA_INFO VALUES ('1351', '410103', '二七区', '3', '410100', null, '1');
INSERT INTO AREA_INFO VALUES ('1352', '410104', '管城回族区', '3', '410100', null, '1');
INSERT INTO AREA_INFO VALUES ('1353', '410105', '金水区', '3', '410100', null, '1');
INSERT INTO AREA_INFO VALUES ('1354', '410106', '上街区', '3', '410100', null, '1');
INSERT INTO AREA_INFO VALUES ('1355', '410108', '惠济区', '3', '410100', null, '1');
INSERT INTO AREA_INFO VALUES ('1356', '410122', '中牟县', '3', '410100', null, '1');
INSERT INTO AREA_INFO VALUES ('1357', '410181', '巩义市', '3', '410100', null, '1');
INSERT INTO AREA_INFO VALUES ('1358', '410182', '荥阳市', '3', '410100', null, '1');
INSERT INTO AREA_INFO VALUES ('1359', '410183', '新密市', '3', '410100', null, '1');
INSERT INTO AREA_INFO VALUES ('1360', '410184', '新郑市', '3', '410100', null, '1');
INSERT INTO AREA_INFO VALUES ('1361', '410185', '登封市', '3', '410100', null, '1');
INSERT INTO AREA_INFO VALUES ('1362', '410200', '开封市', '2', '410000', null, '1');
INSERT INTO AREA_INFO VALUES ('1363', '410201', '市辖区', '3', '410200', null, '1');
INSERT INTO AREA_INFO VALUES ('1364', '410202', '龙亭区', '3', '410200', null, '1');
INSERT INTO AREA_INFO VALUES ('1365', '410203', '顺河回族区', '3', '410200', null, '1');
INSERT INTO AREA_INFO VALUES ('1366', '410204', '鼓楼区', '3', '410200', null, '1');
INSERT INTO AREA_INFO VALUES ('1367', '410205', '禹王台区', '3', '410200', null, '1');
INSERT INTO AREA_INFO VALUES ('1368', '410211', '金明区', '3', '410200', null, '1');
INSERT INTO AREA_INFO VALUES ('1369', '410221', '杞县', '3', '410200', null, '1');
INSERT INTO AREA_INFO VALUES ('1370', '410305', '涧西区', '3', '410300', null, '1');
INSERT INTO AREA_INFO VALUES ('1371', '410306', '吉利区', '3', '410300', null, '1');
INSERT INTO AREA_INFO VALUES ('1372', '410307', '洛龙区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1373', '410322', '孟津县', '3', '410300', null, '1');
INSERT INTO AREA_INFO VALUES ('1374', '410323', '新安县', '3', '410300', null, '1');
INSERT INTO AREA_INFO VALUES ('1375', '410324', '栾川县', '3', '410300', null, '1');
INSERT INTO AREA_INFO VALUES ('1376', '410325', '嵩县', '3', '410300', null, '1');
INSERT INTO AREA_INFO VALUES ('1377', '410728', '长垣县', '3', '410700', null, '1');
INSERT INTO AREA_INFO VALUES ('1378', '410781', '卫辉市', '3', '410700', null, '1');
INSERT INTO AREA_INFO VALUES ('1379', '410782', '辉县市', '3', '410700', null, '1');
INSERT INTO AREA_INFO VALUES ('1380', '410800', '焦作市', '2', '410000', null, '1');
INSERT INTO AREA_INFO VALUES ('1381', '410801', '市辖区', '3', '410800', null, '1');
INSERT INTO AREA_INFO VALUES ('1382', '410802', '解放区', '3', '410800', null, '1');
INSERT INTO AREA_INFO VALUES ('1383', '130982', '任丘市', '3', '130900', null, '1');
INSERT INTO AREA_INFO VALUES ('1384', '130983', '黄骅市', '3', '130900', null, '1');
INSERT INTO AREA_INFO VALUES ('1385', '130984', '河间市', '3', '130900', null, '1');
INSERT INTO AREA_INFO VALUES ('1386', '131000', '廊坊市', '2', '130000', null, '1');
INSERT INTO AREA_INFO VALUES ('1387', '131001', '市辖区', '3', '131000', null, '1');
INSERT INTO AREA_INFO VALUES ('1388', '131002', '安次区', '3', '131000', null, '1');
INSERT INTO AREA_INFO VALUES ('1389', '131003', '广阳区', '3', '131000', null, '1');
INSERT INTO AREA_INFO VALUES ('1390', '131022', '固安县', '3', '131000', null, '1');
INSERT INTO AREA_INFO VALUES ('1391', '131023', '永清县', '3', '131000', null, '1');
INSERT INTO AREA_INFO VALUES ('1392', '131024', '香河县', '3', '131000', null, '1');
INSERT INTO AREA_INFO VALUES ('1393', '131025', '大城县', '3', '131000', null, '1');
INSERT INTO AREA_INFO VALUES ('1394', '131026', '文安县', '3', '131000', null, '1');
INSERT INTO AREA_INFO VALUES ('1395', '131028', '大厂回族自治县', '3', '131000', null, '1');
INSERT INTO AREA_INFO VALUES ('1396', '131081', '霸州市', '3', '131000', null, '1');
INSERT INTO AREA_INFO VALUES ('1397', '131082', '三河市', '3', '131000', null, '1');
INSERT INTO AREA_INFO VALUES ('1398', '131100', '衡水市', '2', '130000', null, '1');
INSERT INTO AREA_INFO VALUES ('1399', '131101', '市辖区', '3', '131100', null, '1');
INSERT INTO AREA_INFO VALUES ('1400', '652328', '木垒哈萨克自治县', '3', '652300', null, '1');
INSERT INTO AREA_INFO VALUES ('1401', '131121', '枣强县', '3', '131100', null, '1');
INSERT INTO AREA_INFO VALUES ('1402', '131122', '武邑县', '3', '131100', null, '1');
INSERT INTO AREA_INFO VALUES ('1403', '131123', '武强县', '3', '131100', null, '1');
INSERT INTO AREA_INFO VALUES ('1404', '131124', '饶阳县', '3', '131100', null, '1');
INSERT INTO AREA_INFO VALUES ('1405', '131125', '安平县', '3', '131100', null, '1');
INSERT INTO AREA_INFO VALUES ('1406', '131126', '故城县', '3', '131100', null, '1');
INSERT INTO AREA_INFO VALUES ('1407', '131127', '景县', '3', '131100', null, '1');
INSERT INTO AREA_INFO VALUES ('1408', '131128', '阜城县', '3', '131100', null, '1');
INSERT INTO AREA_INFO VALUES ('1409', '131181', '冀州市', '3', '131100', null, '1');
INSERT INTO AREA_INFO VALUES ('1410', '131182', '深州市', '3', '131100', null, '1');
INSERT INTO AREA_INFO VALUES ('1411', '140000', '山西省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('1412', '140100', '太原市', '2', '140000', null, '1');
INSERT INTO AREA_INFO VALUES ('1413', '140101', '市辖区', '3', '140100', null, '1');
INSERT INTO AREA_INFO VALUES ('1414', '140105', '小店区', '3', '140100', null, '1');
INSERT INTO AREA_INFO VALUES ('1415', '140106', '迎泽区', '3', '140100', null, '1');
INSERT INTO AREA_INFO VALUES ('1416', '140107', '杏花岭区', '3', '140100', null, '1');
INSERT INTO AREA_INFO VALUES ('1417', '140108', '尖草坪区', '3', '140100', null, '1');
INSERT INTO AREA_INFO VALUES ('1418', '140109', '万柏林区', '3', '140100', null, '1');
INSERT INTO AREA_INFO VALUES ('1419', '140110', '晋源区', '3', '140100', null, '1');
INSERT INTO AREA_INFO VALUES ('1420', '140121', '清徐县', '3', '140100', null, '1');
INSERT INTO AREA_INFO VALUES ('1421', '140122', '阳曲县', '3', '140100', null, '1');
INSERT INTO AREA_INFO VALUES ('1422', '140123', '娄烦县', '3', '140100', null, '1');
INSERT INTO AREA_INFO VALUES ('1423', '140181', '古交市', '3', '140100', null, '1');
INSERT INTO AREA_INFO VALUES ('1424', '140200', '大同市', '2', '140000', null, '1');
INSERT INTO AREA_INFO VALUES ('1425', '140201', '市辖区', '3', '140200', null, '1');
INSERT INTO AREA_INFO VALUES ('1426', '140202', '城区', '3', '140200', null, '1');
INSERT INTO AREA_INFO VALUES ('1427', '140203', '矿区', '3', '140200', null, '1');
INSERT INTO AREA_INFO VALUES ('1428', '140211', '南郊区', '3', '140200', null, '1');
INSERT INTO AREA_INFO VALUES ('1429', '140212', '新荣区', '3', '140200', null, '1');
INSERT INTO AREA_INFO VALUES ('1430', '140221', '阳高县', '3', '140200', null, '1');
INSERT INTO AREA_INFO VALUES ('1431', '140222', '天镇县', '3', '140200', null, '1');
INSERT INTO AREA_INFO VALUES ('1432', '140223', '广灵县', '3', '140200', null, '1');
INSERT INTO AREA_INFO VALUES ('1433', '140224', '灵丘县', '3', '140200', null, '1');
INSERT INTO AREA_INFO VALUES ('1434', '140225', '浑源县', '3', '140200', null, '1');
INSERT INTO AREA_INFO VALUES ('1435', '140226', '左云县', '3', '140200', null, '1');
INSERT INTO AREA_INFO VALUES ('1436', '140227', '大同县', '3', '140200', null, '1');
INSERT INTO AREA_INFO VALUES ('1437', '140300', '阳泉市', '2', '140000', null, '1');
INSERT INTO AREA_INFO VALUES ('1438', '140301', '市辖区', '3', '140300', null, '1');
INSERT INTO AREA_INFO VALUES ('1439', '140302', '城区', '3', '140300', null, '1');
INSERT INTO AREA_INFO VALUES ('1440', '140303', '矿区', '3', '140300', null, '1');
INSERT INTO AREA_INFO VALUES ('1441', '140311', '郊区', '3', '140300', null, '1');
INSERT INTO AREA_INFO VALUES ('1442', '140321', '平定县', '3', '140300', null, '1');
INSERT INTO AREA_INFO VALUES ('1443', '140322', '盂县', '3', '140300', null, '1');
INSERT INTO AREA_INFO VALUES ('1444', '140400', '长治市', '2', '140000', null, '1');
INSERT INTO AREA_INFO VALUES ('1445', '140401', '市辖区', '3', '140400', null, '1');
INSERT INTO AREA_INFO VALUES ('1446', '140402', '城区', '3', '140400', null, '1');
INSERT INTO AREA_INFO VALUES ('1447', '140411', '郊区', '3', '140400', null, '1');
INSERT INTO AREA_INFO VALUES ('1448', '140421', '长治县', '3', '140400', null, '1');
INSERT INTO AREA_INFO VALUES ('1449', '140423', '襄垣县', '3', '140400', null, '1');
INSERT INTO AREA_INFO VALUES ('1450', '140424', '屯留县', '3', '140400', null, '1');
INSERT INTO AREA_INFO VALUES ('1451', '140425', '平顺县', '3', '140400', null, '1');
INSERT INTO AREA_INFO VALUES ('1452', '140426', '黎城县', '3', '140400', null, '1');
INSERT INTO AREA_INFO VALUES ('1453', '140427', '壶关县', '3', '140400', null, '1');
INSERT INTO AREA_INFO VALUES ('1454', '140429', '武乡县', '3', '140400', null, '1');
INSERT INTO AREA_INFO VALUES ('1455', '140430', '沁县', '3', '140400', null, '1');
INSERT INTO AREA_INFO VALUES ('1456', '140431', '沁源县', '3', '140400', null, '1');
INSERT INTO AREA_INFO VALUES ('1457', '140481', '潞城市', '3', '140400', null, '1');
INSERT INTO AREA_INFO VALUES ('1458', '140500', '晋城市', '2', '140000', null, '1');
INSERT INTO AREA_INFO VALUES ('1459', '140501', '市辖区', '3', '140500', null, '1');
INSERT INTO AREA_INFO VALUES ('1460', '140502', '城区', '3', '140500', null, '1');
INSERT INTO AREA_INFO VALUES ('1461', '140521', '沁水县', '3', '140500', null, '1');
INSERT INTO AREA_INFO VALUES ('1462', '140522', '阳城县', '3', '140500', null, '1');
INSERT INTO AREA_INFO VALUES ('1463', '140524', '陵川县', '3', '140500', null, '1');
INSERT INTO AREA_INFO VALUES ('1464', '140525', '泽州县', '3', '140500', null, '1');
INSERT INTO AREA_INFO VALUES ('1465', '140581', '高平市', '3', '140500', null, '1');
INSERT INTO AREA_INFO VALUES ('1466', '140600', '朔州市', '2', '140000', null, '1');
INSERT INTO AREA_INFO VALUES ('1467', '140601', '市辖区', '3', '140600', null, '1');
INSERT INTO AREA_INFO VALUES ('1468', '140602', '朔城区', '3', '140600', null, '1');
INSERT INTO AREA_INFO VALUES ('1469', '140603', '平鲁区', '3', '140600', null, '1');
INSERT INTO AREA_INFO VALUES ('1470', '140621', '山阴县', '3', '140600', null, '1');
INSERT INTO AREA_INFO VALUES ('1471', '140622', '应县', '3', '140600', null, '1');
INSERT INTO AREA_INFO VALUES ('1472', '140623', '右玉县', '3', '140600', null, '1');
INSERT INTO AREA_INFO VALUES ('1473', '140624', '怀仁县', '3', '140600', null, '1');
INSERT INTO AREA_INFO VALUES ('1474', '140700', '晋中市', '2', '140000', null, '1');
INSERT INTO AREA_INFO VALUES ('1475', '140701', '市辖区', '3', '140700', null, '1');
INSERT INTO AREA_INFO VALUES ('1476', '140702', '榆次区', '3', '140700', null, '1');
INSERT INTO AREA_INFO VALUES ('1477', '130527', '南和县', '3', '130500', null, '1');
INSERT INTO AREA_INFO VALUES ('1478', '340101', '市辖区', '3', '340100', null, '1');
INSERT INTO AREA_INFO VALUES ('1479', '340102', '瑶海区', '3', '340100', null, '1');
INSERT INTO AREA_INFO VALUES ('1480', '340103', '庐阳区', '3', '340100', null, '1');
INSERT INTO AREA_INFO VALUES ('1481', '340104', '蜀山区', '3', '340100', null, '1');
INSERT INTO AREA_INFO VALUES ('1482', '340111', '包河区', '3', '340100', null, '1');
INSERT INTO AREA_INFO VALUES ('1483', '340121', '长丰县', '3', '340100', null, '1');
INSERT INTO AREA_INFO VALUES ('1484', '340122', '肥东县', '3', '340100', null, '1');
INSERT INTO AREA_INFO VALUES ('1485', '340123', '肥西县', '3', '340100', null, '1');
INSERT INTO AREA_INFO VALUES ('1486', '340200', '芜湖市', '2', '340000', null, '1');
INSERT INTO AREA_INFO VALUES ('1487', '340201', '市辖区', '3', '340200', null, '1');
INSERT INTO AREA_INFO VALUES ('1488', '340302', '龙子湖区', '3', '340300', null, '1');
INSERT INTO AREA_INFO VALUES ('1489', '340303', '蚌山区', '3', '340300', null, '1');
INSERT INTO AREA_INFO VALUES ('1490', '340304', '禹会区', '3', '340300', null, '1');
INSERT INTO AREA_INFO VALUES ('1491', '340311', '淮上区', '3', '340300', null, '1');
INSERT INTO AREA_INFO VALUES ('1492', '340321', '怀远县', '3', '340300', null, '1');
INSERT INTO AREA_INFO VALUES ('1493', '340322', '五河县', '3', '340300', null, '1');
INSERT INTO AREA_INFO VALUES ('1494', '340323', '固镇县', '3', '340300', null, '1');
INSERT INTO AREA_INFO VALUES ('1495', '340400', '淮南市', '2', '340000', null, '1');
INSERT INTO AREA_INFO VALUES ('1496', '340401', '市辖区', '3', '340400', null, '1');
INSERT INTO AREA_INFO VALUES ('1497', '340402', '大通区', '3', '340400', null, '1');
INSERT INTO AREA_INFO VALUES ('1498', '340403', '田家庵区', '3', '340400', null, '1');
INSERT INTO AREA_INFO VALUES ('1499', '340404', '谢家集区', '3', '340400', null, '1');
INSERT INTO AREA_INFO VALUES ('1500', '340405', '八公山区', '3', '340400', null, '1');
INSERT INTO AREA_INFO VALUES ('1501', '340406', '潘集区', '3', '340400', null, '1');
INSERT INTO AREA_INFO VALUES ('1502', '340421', '凤台县', '3', '340400', null, '1');
INSERT INTO AREA_INFO VALUES ('1503', '340500', '马鞍山市', '2', '340000', null, '1');
INSERT INTO AREA_INFO VALUES ('1504', '340501', '市辖区', '3', '340500', null, '1');
INSERT INTO AREA_INFO VALUES ('1505', '340502', '金家庄区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1506', '340503', '花山区', '3', '340500', null, '1');
INSERT INTO AREA_INFO VALUES ('1507', '340504', '雨山区', '3', '340500', null, '1');
INSERT INTO AREA_INFO VALUES ('1508', '340521', '当涂县', '3', '340500', null, '1');
INSERT INTO AREA_INFO VALUES ('1509', '340600', '淮北市', '2', '340000', null, '1');
INSERT INTO AREA_INFO VALUES ('1510', '340601', '市辖区', '3', '340600', null, '1');
INSERT INTO AREA_INFO VALUES ('1511', '340602', '杜集区', '3', '340600', null, '1');
INSERT INTO AREA_INFO VALUES ('1512', '340603', '相山区', '3', '340600', null, '1');
INSERT INTO AREA_INFO VALUES ('1513', '340604', '烈山区', '3', '340600', null, '1');
INSERT INTO AREA_INFO VALUES ('1514', '340621', '濉溪县', '3', '340600', null, '1');
INSERT INTO AREA_INFO VALUES ('1515', '340700', '铜陵市', '2', '340000', null, '1');
INSERT INTO AREA_INFO VALUES ('1516', '340701', '市辖区', '3', '340700', null, '1');
INSERT INTO AREA_INFO VALUES ('1517', '340702', '铜官山区', '3', '340700', null, '1');
INSERT INTO AREA_INFO VALUES ('1518', '340703', '狮子山区', '3', '340700', null, '1');
INSERT INTO AREA_INFO VALUES ('1519', '340711', '郊区', '3', '340700', null, '1');
INSERT INTO AREA_INFO VALUES ('1520', '340721', '铜陵县', '3', '340700', null, '1');
INSERT INTO AREA_INFO VALUES ('1521', '340800', '安庆市', '2', '340000', null, '1');
INSERT INTO AREA_INFO VALUES ('1522', '340801', '市辖区', '3', '340800', null, '1');
INSERT INTO AREA_INFO VALUES ('1523', '220800', '白城市', '2', '220000', null, '1');
INSERT INTO AREA_INFO VALUES ('1524', '220801', '市辖区', '3', '220800', null, '1');
INSERT INTO AREA_INFO VALUES ('1525', '220802', '洮北区', '3', '220800', null, '1');
INSERT INTO AREA_INFO VALUES ('1526', '220821', '镇赉县', '3', '220800', null, '1');
INSERT INTO AREA_INFO VALUES ('1527', '220822', '通榆县', '3', '220800', null, '1');
INSERT INTO AREA_INFO VALUES ('1528', '220881', '洮南市', '3', '220800', null, '1');
INSERT INTO AREA_INFO VALUES ('1529', '220882', '大安市', '3', '220800', null, '1');
INSERT INTO AREA_INFO VALUES ('1530', '222400', '延边朝鲜族自治州', '2', '220000', null, '1');
INSERT INTO AREA_INFO VALUES ('1531', '222401', '延吉市', '3', '222400', null, '1');
INSERT INTO AREA_INFO VALUES ('1532', '222402', '图们市', '3', '222400', null, '1');
INSERT INTO AREA_INFO VALUES ('1533', '222403', '敦化市', '3', '222400', null, '1');
INSERT INTO AREA_INFO VALUES ('1534', '222404', '珲春市', '3', '222400', null, '1');
INSERT INTO AREA_INFO VALUES ('1535', '222405', '龙井市', '3', '222400', null, '1');
INSERT INTO AREA_INFO VALUES ('1536', '222406', '和龙市', '3', '222400', null, '1');
INSERT INTO AREA_INFO VALUES ('1537', '222424', '汪清县', '3', '222400', null, '1');
INSERT INTO AREA_INFO VALUES ('1538', '222426', '安图县', '3', '222400', null, '1');
INSERT INTO AREA_INFO VALUES ('1539', '230000', '黑龙江省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('1540', '230100', '哈尔滨市', '2', '230000', null, '1');
INSERT INTO AREA_INFO VALUES ('1541', '230101', '市辖区', '3', '230100', null, '1');
INSERT INTO AREA_INFO VALUES ('1542', '230102', '道里区', '3', '230100', null, '1');
INSERT INTO AREA_INFO VALUES ('1543', '230103', '南岗区', '3', '230100', null, '1');
INSERT INTO AREA_INFO VALUES ('1544', '230104', '道外区', '3', '230100', null, '1');
INSERT INTO AREA_INFO VALUES ('1545', '230108', '平房区', '3', '230100', null, '1');
INSERT INTO AREA_INFO VALUES ('1546', '230109', '松北区', '3', '230100', null, '1');
INSERT INTO AREA_INFO VALUES ('1547', '230110', '香坊区', '3', '230100', null, '1');
INSERT INTO AREA_INFO VALUES ('1548', '230111', '呼兰区', '3', '230100', null, '1');
INSERT INTO AREA_INFO VALUES ('1549', '230112', '阿城区', '3', '230100', null, '1');
INSERT INTO AREA_INFO VALUES ('1550', '230123', '依兰县', '3', '230100', null, '1');
INSERT INTO AREA_INFO VALUES ('1551', '230124', '方正县', '3', '230100', null, '1');
INSERT INTO AREA_INFO VALUES ('1552', '230125', '宾县', '3', '230100', null, '1');
INSERT INTO AREA_INFO VALUES ('1553', '230126', '巴彦县', '3', '230100', null, '1');
INSERT INTO AREA_INFO VALUES ('1554', '230127', '木兰县', '3', '230100', null, '1');
INSERT INTO AREA_INFO VALUES ('1555', '230128', '通河县', '3', '230100', null, '1');
INSERT INTO AREA_INFO VALUES ('1556', '230129', '延寿县', '3', '230100', null, '1');
INSERT INTO AREA_INFO VALUES ('1557', '230182', '双城市', '3', '230100', null, '1');
INSERT INTO AREA_INFO VALUES ('1558', '230183', '尚志市', '3', '230100', null, '1');
INSERT INTO AREA_INFO VALUES ('1559', '230184', '五常市', '3', '230100', null, '1');
INSERT INTO AREA_INFO VALUES ('1560', '230200', '齐齐哈尔市', '2', '230000', null, '1');
INSERT INTO AREA_INFO VALUES ('1561', '230201', '市辖区', '3', '230200', null, '1');
INSERT INTO AREA_INFO VALUES ('1562', '230202', '龙沙区', '3', '230200', null, '1');
INSERT INTO AREA_INFO VALUES ('1563', '230203', '建华区', '3', '230200', null, '1');
INSERT INTO AREA_INFO VALUES ('1564', '230204', '铁锋区', '3', '230200', null, '1');
INSERT INTO AREA_INFO VALUES ('1565', '230205', '昂昂溪区', '3', '230200', null, '1');
INSERT INTO AREA_INFO VALUES ('1566', '230206', '富拉尔基区', '3', '230200', null, '1');
INSERT INTO AREA_INFO VALUES ('1567', '230300', '鸡西市', '2', '230000', null, '1');
INSERT INTO AREA_INFO VALUES ('1568', '230305', '梨树区', '3', '230300', null, '1');
INSERT INTO AREA_INFO VALUES ('1569', '230306', '城子河区', '3', '230300', null, '1');
INSERT INTO AREA_INFO VALUES ('1570', '230307', '麻山区', '3', '230300', null, '1');
INSERT INTO AREA_INFO VALUES ('1571', '230321', '鸡东县', '3', '230300', null, '1');
INSERT INTO AREA_INFO VALUES ('1572', '230381', '虎林市', '3', '230300', null, '1');
INSERT INTO AREA_INFO VALUES ('1573', '230382', '密山市', '3', '230300', null, '1');
INSERT INTO AREA_INFO VALUES ('1574', '230400', '鹤岗市', '2', '230000', null, '1');
INSERT INTO AREA_INFO VALUES ('1575', '230401', '市辖区', '3', '230400', null, '1');
INSERT INTO AREA_INFO VALUES ('1576', '230402', '向阳区', '3', '230400', null, '1');
INSERT INTO AREA_INFO VALUES ('1577', '230403', '工农区', '3', '230400', null, '1');
INSERT INTO AREA_INFO VALUES ('1578', '230404', '南山区', '3', '230400', null, '1');
INSERT INTO AREA_INFO VALUES ('1579', '230405', '兴安区', '3', '230400', null, '1');
INSERT INTO AREA_INFO VALUES ('1580', '230406', '东山区', '3', '230400', null, '1');
INSERT INTO AREA_INFO VALUES ('1581', '230407', '兴山区', '3', '230400', null, '1');
INSERT INTO AREA_INFO VALUES ('1582', '230421', '萝北县', '3', '230400', null, '1');
INSERT INTO AREA_INFO VALUES ('1583', '230422', '绥滨县', '3', '230400', null, '1');
INSERT INTO AREA_INFO VALUES ('1584', '230500', '双鸭山市', '2', '230000', null, '1');
INSERT INTO AREA_INFO VALUES ('1585', '230501', '市辖区', '3', '230500', null, '1');
INSERT INTO AREA_INFO VALUES ('1586', '230502', '尖山区', '3', '230500', null, '1');
INSERT INTO AREA_INFO VALUES ('1587', '230503', '岭东区', '3', '230500', null, '1');
INSERT INTO AREA_INFO VALUES ('1588', '230505', '四方台区', '3', '230500', null, '1');
INSERT INTO AREA_INFO VALUES ('1589', '230506', '宝山区', '3', '230500', null, '1');
INSERT INTO AREA_INFO VALUES ('1590', '230521', '集贤县', '3', '230500', null, '1');
INSERT INTO AREA_INFO VALUES ('1591', '230522', '友谊县', '3', '230500', null, '1');
INSERT INTO AREA_INFO VALUES ('1592', '230523', '宝清县', '3', '230500', null, '1');
INSERT INTO AREA_INFO VALUES ('1593', '230524', '饶河县', '3', '230500', null, '1');
INSERT INTO AREA_INFO VALUES ('1594', '230600', '大庆市', '2', '230000', null, '1');
INSERT INTO AREA_INFO VALUES ('1595', '230601', '市辖区', '3', '230600', null, '1');
INSERT INTO AREA_INFO VALUES ('1596', '230602', '萨尔图区', '3', '230600', null, '1');
INSERT INTO AREA_INFO VALUES ('1597', '230603', '龙凤区', '3', '230600', null, '1');
INSERT INTO AREA_INFO VALUES ('1598', '230604', '让胡路区', '3', '230600', null, '1');
INSERT INTO AREA_INFO VALUES ('1599', '230605', '红岗区', '3', '230600', null, '1');
INSERT INTO AREA_INFO VALUES ('1600', '230606', '大同区', '3', '230600', null, '1');
INSERT INTO AREA_INFO VALUES ('1601', '230621', '肇州县', '3', '230600', null, '1');
INSERT INTO AREA_INFO VALUES ('1602', '230622', '肇源县', '3', '230600', null, '1');
INSERT INTO AREA_INFO VALUES ('1603', '230623', '林甸县', '3', '230600', null, '1');
INSERT INTO AREA_INFO VALUES ('1604', '230624', '杜尔伯特蒙古族自治县', '3', '230600', null, '1');
INSERT INTO AREA_INFO VALUES ('1605', '230700', '伊春市', '2', '230000', null, '1');
INSERT INTO AREA_INFO VALUES ('1606', '230701', '市辖区', '3', '230700', null, '1');
INSERT INTO AREA_INFO VALUES ('1607', '230702', '伊春区', '3', '230700', null, '1');
INSERT INTO AREA_INFO VALUES ('1608', '230703', '南岔区', '3', '230700', null, '1');
INSERT INTO AREA_INFO VALUES ('1609', '230704', '友好区', '3', '230700', null, '1');
INSERT INTO AREA_INFO VALUES ('1610', '230705', '西林区', '3', '230700', null, '1');
INSERT INTO AREA_INFO VALUES ('1611', '230706', '翠峦区', '3', '230700', null, '1');
INSERT INTO AREA_INFO VALUES ('1612', '230707', '新青区', '3', '230700', null, '1');
INSERT INTO AREA_INFO VALUES ('1613', '230708', '美溪区', '3', '230700', null, '1');
INSERT INTO AREA_INFO VALUES ('1614', '230709', '金山屯区', '3', '230700', null, '1');
INSERT INTO AREA_INFO VALUES ('1615', '230710', '五营区', '3', '230700', null, '1');
INSERT INTO AREA_INFO VALUES ('1616', '230711', '乌马河区', '3', '230700', null, '1');
INSERT INTO AREA_INFO VALUES ('1617', '230712', '汤旺河区', '3', '230700', null, '1');
INSERT INTO AREA_INFO VALUES ('1618', '230713', '带岭区', '3', '230700', null, '1');
INSERT INTO AREA_INFO VALUES ('1619', '230714', '乌伊岭区', '3', '230700', null, '1');
INSERT INTO AREA_INFO VALUES ('1620', '230715', '红星区', '3', '230700', null, '1');
INSERT INTO AREA_INFO VALUES ('1621', '230716', '上甘岭区', '3', '230700', null, '1');
INSERT INTO AREA_INFO VALUES ('1622', '230722', '嘉荫县', '3', '230700', null, '1');
INSERT INTO AREA_INFO VALUES ('1774', '231202', '北林区', '3', '231200', null, '1');
INSERT INTO AREA_INFO VALUES ('1775', '231221', '望奎县', '3', '231200', null, '1');
INSERT INTO AREA_INFO VALUES ('1776', '231222', '兰西县', '3', '231200', null, '1');
INSERT INTO AREA_INFO VALUES ('1777', '231223', '青冈县', '3', '231200', null, '1');
INSERT INTO AREA_INFO VALUES ('1778', '231224', '庆安县', '3', '231200', null, '1');
INSERT INTO AREA_INFO VALUES ('1779', '231225', '明水县', '3', '231200', null, '1');
INSERT INTO AREA_INFO VALUES ('1780', '231226', '绥棱县', '3', '231200', null, '1');
INSERT INTO AREA_INFO VALUES ('1781', '231281', '安达市', '3', '231200', null, '1');
INSERT INTO AREA_INFO VALUES ('1782', '231282', '肇东市', '3', '231200', null, '1');
INSERT INTO AREA_INFO VALUES ('1783', '231283', '海伦市', '3', '231200', null, '1');
INSERT INTO AREA_INFO VALUES ('1784', '232700', '大兴安岭地区', '2', '230000', null, '1');
INSERT INTO AREA_INFO VALUES ('1785', '232701', '加格达奇区', '3', '232700', null, '1');
INSERT INTO AREA_INFO VALUES ('1786', '232702', '松岭区', '3', '232700', null, '1');
INSERT INTO AREA_INFO VALUES ('1787', '232703', '新林区', '3', '232700', null, '1');
INSERT INTO AREA_INFO VALUES ('1788', '232704', '呼中区', '3', '232700', null, '1');
INSERT INTO AREA_INFO VALUES ('1789', '232721', '呼玛县', '3', '232700', null, '1');
INSERT INTO AREA_INFO VALUES ('1790', '232722', '塔河县', '3', '232700', null, '1');
INSERT INTO AREA_INFO VALUES ('1791', '232723', '漠河县', '3', '232700', null, '1');
INSERT INTO AREA_INFO VALUES ('1792', '310000', '上海市', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('1793', '310100', '市辖区', '2', '310000', null, '1');
INSERT INTO AREA_INFO VALUES ('1794', '310101', '黄浦区', '3', '310100', null, '1');
INSERT INTO AREA_INFO VALUES ('1795', '310103', '卢湾区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1796', '310104', '徐汇区', '3', '310100', null, '1');
INSERT INTO AREA_INFO VALUES ('1797', '310105', '长宁区', '3', '310100', null, '1');
INSERT INTO AREA_INFO VALUES ('1798', '310106', '静安区', '3', '310100', null, '1');
INSERT INTO AREA_INFO VALUES ('1799', '310107', '普陀区', '3', '310100', null, '1');
INSERT INTO AREA_INFO VALUES ('1800', '310108', '闸北区', '3', '310100', null, '1');
INSERT INTO AREA_INFO VALUES ('1801', '310109', '虹口区', '3', '310100', null, '1');
INSERT INTO AREA_INFO VALUES ('1802', '310110', '杨浦区', '3', '310100', null, '1');
INSERT INTO AREA_INFO VALUES ('1803', '310112', '闵行区', '3', '310100', null, '1');
INSERT INTO AREA_INFO VALUES ('1804', '310113', '宝山区', '3', '310100', null, '1');
INSERT INTO AREA_INFO VALUES ('1805', '310114', '嘉定区', '3', '310100', null, '1');
INSERT INTO AREA_INFO VALUES ('1806', '310115', '浦东新区', '3', '310100', null, '1');
INSERT INTO AREA_INFO VALUES ('1807', '310116', '金山区', '3', '310100', null, '1');
INSERT INTO AREA_INFO VALUES ('1808', '310117', '松江区', '3', '310100', null, '1');
INSERT INTO AREA_INFO VALUES ('1809', '310118', '青浦区', '3', '310100', null, '1');
INSERT INTO AREA_INFO VALUES ('1810', '310119', '南汇区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1811', '310120', '奉贤区', '3', '310100', null, '1');
INSERT INTO AREA_INFO VALUES ('1812', '310200', '县', '2', '310000', null, '1');
INSERT INTO AREA_INFO VALUES ('1813', '310230', '崇明县', '3', '310100', null, '1');
INSERT INTO AREA_INFO VALUES ('1814', '320000', '江苏省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('1815', '320100', '南京市', '2', '320000', null, '1');
INSERT INTO AREA_INFO VALUES ('1816', '320101', '市辖区', '3', '320100', null, '1');
INSERT INTO AREA_INFO VALUES ('1817', '320102', '玄武区', '3', '320100', null, '1');
INSERT INTO AREA_INFO VALUES ('1818', '320103', '白下区', '3', '320100', null, '1');
INSERT INTO AREA_INFO VALUES ('1819', '320104', '秦淮区', '3', '320100', null, '1');
INSERT INTO AREA_INFO VALUES ('1820', '320105', '建邺区', '3', '320100', null, '1');
INSERT INTO AREA_INFO VALUES ('1821', '320107', '下关区', '3', '320100', null, '1');
INSERT INTO AREA_INFO VALUES ('1822', '320111', '浦口区', '3', '320100', null, '1');
INSERT INTO AREA_INFO VALUES ('1823', '320113', '栖霞区', '3', '320100', null, '1');
INSERT INTO AREA_INFO VALUES ('1824', '320114', '雨花台区', '3', '320100', null, '1');
INSERT INTO AREA_INFO VALUES ('1825', '320115', '江宁区', '3', '320100', null, '1');
INSERT INTO AREA_INFO VALUES ('1826', '320116', '六合区', '3', '320100', null, '1');
INSERT INTO AREA_INFO VALUES ('1827', '320124', '溧水县', '3', '320100', null, '1');
INSERT INTO AREA_INFO VALUES ('1828', '320125', '高淳县', '3', '320100', null, '1');
INSERT INTO AREA_INFO VALUES ('1829', '320200', '无锡市', '2', '320000', null, '1');
INSERT INTO AREA_INFO VALUES ('1830', '320201', '市辖区', '3', '320200', null, '1');
INSERT INTO AREA_INFO VALUES ('1831', '320202', '崇安区', '3', '320200', null, '1');
INSERT INTO AREA_INFO VALUES ('1832', '320203', '南长区', '3', '320200', null, '1');
INSERT INTO AREA_INFO VALUES ('1833', '320204', '北塘区', '3', '320200', null, '1');
INSERT INTO AREA_INFO VALUES ('1834', '320205', '锡山区', '3', '320200', null, '1');
INSERT INTO AREA_INFO VALUES ('1835', '320206', '惠山区', '3', '320200', null, '1');
INSERT INTO AREA_INFO VALUES ('1836', '320211', '滨湖区', '3', '320200', null, '1');
INSERT INTO AREA_INFO VALUES ('1837', '320281', '江阴市', '3', '320200', null, '1');
INSERT INTO AREA_INFO VALUES ('1838', '320282', '宜兴市', '3', '320200', null, '1');
INSERT INTO AREA_INFO VALUES ('1839', '320300', '徐州市', '2', '320000', null, '1');
INSERT INTO AREA_INFO VALUES ('1840', '320301', '市辖区', '3', '320300', null, '1');
INSERT INTO AREA_INFO VALUES ('1841', '320302', '鼓楼区', '3', '320300', null, '1');
INSERT INTO AREA_INFO VALUES ('1842', '320303', '云龙区', '3', '320300', null, '1');
INSERT INTO AREA_INFO VALUES ('1843', '320304', '九里区', '3', '320300', null, '1');
INSERT INTO AREA_INFO VALUES ('1844', '320305', '贾汪区', '3', '320300', null, '1');
INSERT INTO AREA_INFO VALUES ('1845', '320311', '泉山区', '3', '320300', null, '1');
INSERT INTO AREA_INFO VALUES ('1846', '320321', '丰县', '3', '320300', null, '1');
INSERT INTO AREA_INFO VALUES ('1847', '320322', '沛县', '3', '320300', null, '1');
INSERT INTO AREA_INFO VALUES ('1848', '320323', '铜山县', '3', '320300', null, '1');
INSERT INTO AREA_INFO VALUES ('1849', '320324', '睢宁县', '3', '320300', null, '1');
INSERT INTO AREA_INFO VALUES ('1850', '320381', '新沂市', '3', '320300', null, '1');
INSERT INTO AREA_INFO VALUES ('1851', '320382', '邳州市', '3', '320300', null, '1');
INSERT INTO AREA_INFO VALUES ('1852', '320400', '常州市', '2', '320000', null, '1');
INSERT INTO AREA_INFO VALUES ('1853', '320401', '市辖区', '3', '320400', null, '1');
INSERT INTO AREA_INFO VALUES ('1854', '320402', '天宁区', '3', '320400', null, '1');
INSERT INTO AREA_INFO VALUES ('1855', '320404', '钟楼区', '3', '320400', null, '1');
INSERT INTO AREA_INFO VALUES ('1856', '320405', '戚墅堰区', '3', '320400', null, '1');
INSERT INTO AREA_INFO VALUES ('1857', '320411', '新北区', '3', '320400', null, '1');
INSERT INTO AREA_INFO VALUES ('1858', '320412', '武进区', '3', '320400', null, '1');
INSERT INTO AREA_INFO VALUES ('1859', '320481', '溧阳市', '3', '320400', null, '1');
INSERT INTO AREA_INFO VALUES ('1860', '320482', '金坛市', '3', '320400', null, '1');
INSERT INTO AREA_INFO VALUES ('1861', '320500', '苏州市', '2', '320000', null, '1');
INSERT INTO AREA_INFO VALUES ('1862', '320501', '市辖区', '3', '320500', null, '1');
INSERT INTO AREA_INFO VALUES ('1863', '522424', '金沙县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1864', '522425', '织金县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1865', '522426', '纳雍县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1866', '522702', '福泉市', '3', '522700', null, '1');
INSERT INTO AREA_INFO VALUES ('1867', '522722', '荔波县', '3', '522700', null, '1');
INSERT INTO AREA_INFO VALUES ('1868', '522723', '贵定县', '3', '522700', null, '1');
INSERT INTO AREA_INFO VALUES ('1869', '522725', '瓮安县', '3', '522700', null, '1');
INSERT INTO AREA_INFO VALUES ('1870', '522726', '独山县', '3', '522700', null, '1');
INSERT INTO AREA_INFO VALUES ('1871', '522727', '平塘县', '3', '522700', null, '1');
INSERT INTO AREA_INFO VALUES ('1872', '522728', '罗甸县', '3', '522700', null, '1');
INSERT INTO AREA_INFO VALUES ('1873', '522729', '长顺县', '3', '522700', null, '1');
INSERT INTO AREA_INFO VALUES ('1874', '522730', '龙里县', '3', '522700', null, '1');
INSERT INTO AREA_INFO VALUES ('1875', '522731', '惠水县', '3', '522700', null, '1');
INSERT INTO AREA_INFO VALUES ('1876', '522732', '三都水族自治县', '3', '522700', null, '1');
INSERT INTO AREA_INFO VALUES ('1877', '530000', '云南省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('1878', '530100', '昆明市', '2', '530000', null, '1');
INSERT INTO AREA_INFO VALUES ('1879', '530101', '市辖区', '3', '530100', null, '1');
INSERT INTO AREA_INFO VALUES ('1880', '530102', '五华区', '3', '530100', null, '1');
INSERT INTO AREA_INFO VALUES ('1881', '530103', '盘龙区', '3', '530100', null, '1');
INSERT INTO AREA_INFO VALUES ('1882', '530111', '官渡区', '3', '530100', null, '1');
INSERT INTO AREA_INFO VALUES ('1883', '530112', '西山区', '3', '530100', null, '1');
INSERT INTO AREA_INFO VALUES ('1884', '530113', '东川区', '3', '530100', null, '1');
INSERT INTO AREA_INFO VALUES ('1885', '530121', '呈贡县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1886', '530122', '晋宁县', '3', '530100', null, '1');
INSERT INTO AREA_INFO VALUES ('1887', '530124', '富民县', '3', '530100', null, '1');
INSERT INTO AREA_INFO VALUES ('1888', '530125', '宜良县', '3', '530100', null, '1');
INSERT INTO AREA_INFO VALUES ('1889', '530126', '石林彝族自治县', '3', '530100', null, '1');
INSERT INTO AREA_INFO VALUES ('1890', '530127', '嵩明县', '3', '530100', null, '1');
INSERT INTO AREA_INFO VALUES ('1891', '530128', '禄劝彝族苗族自治县', '3', '530100', null, '1');
INSERT INTO AREA_INFO VALUES ('1892', '530129', '寻甸回族彝族自治县', '3', '530100', null, '1');
INSERT INTO AREA_INFO VALUES ('1893', '530181', '安宁市', '3', '530100', null, '1');
INSERT INTO AREA_INFO VALUES ('1894', '530300', '曲靖市', '2', '530000', null, '1');
INSERT INTO AREA_INFO VALUES ('1895', '530301', '市辖区', '3', '530300', null, '1');
INSERT INTO AREA_INFO VALUES ('1896', '530302', '麒麟区', '3', '530300', null, '1');
INSERT INTO AREA_INFO VALUES ('1897', '530321', '马龙县', '3', '530300', null, '1');
INSERT INTO AREA_INFO VALUES ('1898', '530322', '陆良县', '3', '530300', null, '1');
INSERT INTO AREA_INFO VALUES ('1899', '530323', '师宗县', '3', '530300', null, '1');
INSERT INTO AREA_INFO VALUES ('1900', '530324', '罗平县', '3', '530300', null, '1');
INSERT INTO AREA_INFO VALUES ('1901', '530325', '富源县', '3', '530300', null, '1');
INSERT INTO AREA_INFO VALUES ('1902', '530326', '会泽县', '3', '530300', null, '1');
INSERT INTO AREA_INFO VALUES ('1903', '530328', '沾益县', '3', '530300', null, '1');
INSERT INTO AREA_INFO VALUES ('1904', '530381', '宣威市', '3', '530300', null, '1');
INSERT INTO AREA_INFO VALUES ('1905', '530400', '玉溪市', '2', '530000', null, '1');
INSERT INTO AREA_INFO VALUES ('1906', '530401', '市辖区', '3', '530400', null, '1');
INSERT INTO AREA_INFO VALUES ('1907', '530402', '红塔区', '3', '530400', null, '1');
INSERT INTO AREA_INFO VALUES ('1908', '530421', '江川县', '3', '530400', null, '1');
INSERT INTO AREA_INFO VALUES ('1909', '530422', '澄江县', '3', '530400', null, '1');
INSERT INTO AREA_INFO VALUES ('1910', '530423', '通海县', '3', '530400', null, '1');
INSERT INTO AREA_INFO VALUES ('1911', '530424', '华宁县', '3', '530400', null, '1');
INSERT INTO AREA_INFO VALUES ('1912', '530425', '易门县', '3', '530400', null, '1');
INSERT INTO AREA_INFO VALUES ('1913', '530721', '玉龙纳西族自治县', '3', '530700', null, '1');
INSERT INTO AREA_INFO VALUES ('1914', '530722', '永胜县', '3', '530700', null, '1');
INSERT INTO AREA_INFO VALUES ('1915', '530723', '华坪县', '3', '530700', null, '1');
INSERT INTO AREA_INFO VALUES ('1916', '530724', '宁蒗彝族自治县', '3', '530700', null, '1');
INSERT INTO AREA_INFO VALUES ('1917', '530800', '普洱市', '2', '530000', null, '1');
INSERT INTO AREA_INFO VALUES ('1918', '530801', '市辖区', '3', '530800', null, '1');
INSERT INTO AREA_INFO VALUES ('1919', '530802', '思茅区', '3', '530800', null, '1');
INSERT INTO AREA_INFO VALUES ('1920', '530821', '宁洱哈尼族彝族自治县', '3', '530800', null, '1');
INSERT INTO AREA_INFO VALUES ('1623', '230781', '铁力市', '3', '230700', null, '1');
INSERT INTO AREA_INFO VALUES ('1624', '230800', '佳木斯市', '2', '230000', null, '1');
INSERT INTO AREA_INFO VALUES ('1625', '230801', '市辖区', '3', '230800', null, '1');
INSERT INTO AREA_INFO VALUES ('1626', '230803', '向阳区', '3', '230800', null, '1');
INSERT INTO AREA_INFO VALUES ('1627', '230804', '前进区', '3', '230800', null, '1');
INSERT INTO AREA_INFO VALUES ('1628', '230805', '东风区', '3', '230800', null, '1');
INSERT INTO AREA_INFO VALUES ('1629', '230811', '郊区', '3', '230800', null, '1');
INSERT INTO AREA_INFO VALUES ('1630', '230822', '桦南县', '3', '230800', null, '1');
INSERT INTO AREA_INFO VALUES ('1631', '230826', '桦川县', '3', '230800', null, '1');
INSERT INTO AREA_INFO VALUES ('1632', '230828', '汤原县', '3', '230800', null, '1');
INSERT INTO AREA_INFO VALUES ('1633', '230833', '抚远县', '3', '230800', null, '1');
INSERT INTO AREA_INFO VALUES ('1634', '230881', '同江市', '3', '230800', null, '1');
INSERT INTO AREA_INFO VALUES ('1635', '230882', '富锦市', '3', '230800', null, '1');
INSERT INTO AREA_INFO VALUES ('1636', '230900', '七台河市', '2', '230000', null, '1');
INSERT INTO AREA_INFO VALUES ('1637', '230901', '市辖区', '3', '230900', null, '1');
INSERT INTO AREA_INFO VALUES ('1638', '230902', '新兴区', '3', '230900', null, '1');
INSERT INTO AREA_INFO VALUES ('1639', '230903', '桃山区', '3', '230900', null, '1');
INSERT INTO AREA_INFO VALUES ('1640', '230904', '茄子河区', '3', '230900', null, '1');
INSERT INTO AREA_INFO VALUES ('1641', '230921', '勃利县', '3', '230900', null, '1');
INSERT INTO AREA_INFO VALUES ('1642', '231000', '牡丹江市', '2', '230000', null, '1');
INSERT INTO AREA_INFO VALUES ('1643', '231001', '市辖区', '3', '231000', null, '1');
INSERT INTO AREA_INFO VALUES ('1644', '231002', '东安区', '3', '231000', null, '1');
INSERT INTO AREA_INFO VALUES ('1645', '540102', '城关区', '3', '540100', null, '1');
INSERT INTO AREA_INFO VALUES ('1646', '540121', '林周县', '3', '540100', null, '1');
INSERT INTO AREA_INFO VALUES ('1647', '540122', '当雄县', '3', '540100', null, '1');
INSERT INTO AREA_INFO VALUES ('1648', '540123', '尼木县', '3', '540100', null, '1');
INSERT INTO AREA_INFO VALUES ('1649', '540124', '曲水县', '3', '540100', null, '1');
INSERT INTO AREA_INFO VALUES ('1650', '540125', '堆龙德庆县', '3', '540100', null, '1');
INSERT INTO AREA_INFO VALUES ('1651', '540126', '达孜县', '3', '540100', null, '1');
INSERT INTO AREA_INFO VALUES ('1652', '540127', '墨竹工卡县', '3', '540100', null, '1');
INSERT INTO AREA_INFO VALUES ('1653', '542100', '昌都地区', '2', '540000', null, '1');
INSERT INTO AREA_INFO VALUES ('1654', '542121', '昌都县', '3', '542100', null, '1');
INSERT INTO AREA_INFO VALUES ('1655', '542122', '江达县', '3', '542100', null, '1');
INSERT INTO AREA_INFO VALUES ('1656', '542123', '贡觉县', '3', '542100', null, '1');
INSERT INTO AREA_INFO VALUES ('1657', '542124', '类乌齐县', '3', '542100', null, '1');
INSERT INTO AREA_INFO VALUES ('1658', '542125', '丁青县', '3', '542100', null, '1');
INSERT INTO AREA_INFO VALUES ('1659', '542126', '察雅县', '3', '542100', null, '1');
INSERT INTO AREA_INFO VALUES ('1660', '542127', '八宿县', '3', '542100', null, '1');
INSERT INTO AREA_INFO VALUES ('1661', '542128', '左贡县', '3', '542100', null, '1');
INSERT INTO AREA_INFO VALUES ('1662', '542129', '芒康县', '3', '542100', null, '1');
INSERT INTO AREA_INFO VALUES ('1663', '542132', '洛隆县', '3', '542100', null, '1');
INSERT INTO AREA_INFO VALUES ('1664', '542133', '边坝县', '3', '542100', null, '1');
INSERT INTO AREA_INFO VALUES ('1665', '542200', '山南地区', '2', '540000', null, '1');
INSERT INTO AREA_INFO VALUES ('1666', '542221', '乃东县', '3', '542200', null, '1');
INSERT INTO AREA_INFO VALUES ('1667', '542222', '扎囊县', '3', '542200', null, '1');
INSERT INTO AREA_INFO VALUES ('1668', '542223', '贡嘎县', '3', '542200', null, '1');
INSERT INTO AREA_INFO VALUES ('1669', '542224', '桑日县', '3', '542200', null, '1');
INSERT INTO AREA_INFO VALUES ('1670', '542225', '琼结县', '3', '542200', null, '1');
INSERT INTO AREA_INFO VALUES ('1671', '542227', '措美县', '3', '542200', null, '1');
INSERT INTO AREA_INFO VALUES ('1672', '542228', '洛扎县', '3', '542200', null, '1');
INSERT INTO AREA_INFO VALUES ('1673', '542325', '萨迦县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1674', '542326', '拉孜县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1675', '542327', '昂仁县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1676', '542328', '谢通门县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1677', '542329', '白朗县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1678', '542330', '仁布县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1679', '542331', '康马县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1680', '542332', '定结县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1681', '542333', '仲巴县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1682', '542334', '亚东县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1683', '542335', '吉隆县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1684', '542336', '聂拉木县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1685', '542337', '萨嘎县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1686', '542338', '岗巴县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1687', '542400', '那曲地区', '2', '540000', null, '1');
INSERT INTO AREA_INFO VALUES ('1688', '542426', '申扎县', '3', '542400', null, '1');
INSERT INTO AREA_INFO VALUES ('1689', '542427', '索县', '3', '542400', null, '1');
INSERT INTO AREA_INFO VALUES ('1690', '542428', '班戈县', '3', '542400', null, '1');
INSERT INTO AREA_INFO VALUES ('1691', '542429', '巴青县', '3', '542400', null, '1');
INSERT INTO AREA_INFO VALUES ('1692', '542525', '革吉县', '3', '542500', null, '1');
INSERT INTO AREA_INFO VALUES ('1693', '542526', '改则县', '3', '542500', null, '1');
INSERT INTO AREA_INFO VALUES ('1694', '542527', '措勤县', '3', '542500', null, '1');
INSERT INTO AREA_INFO VALUES ('1695', '542600', '林芝地区', '2', '540000', null, '1');
INSERT INTO AREA_INFO VALUES ('1696', '542621', '林芝县', '3', '542600', null, '1');
INSERT INTO AREA_INFO VALUES ('1697', '542622', '工布江达县', '3', '542600', null, '1');
INSERT INTO AREA_INFO VALUES ('1698', '542623', '米林县', '3', '542600', null, '1');
INSERT INTO AREA_INFO VALUES ('1699', '542624', '墨脱县', '3', '542600', null, '1');
INSERT INTO AREA_INFO VALUES ('1700', '542625', '波密县', '3', '542600', null, '1');
INSERT INTO AREA_INFO VALUES ('1701', '542626', '察隅县', '3', '542600', null, '1');
INSERT INTO AREA_INFO VALUES ('1702', '542627', '朗县', '3', '542600', null, '1');
INSERT INTO AREA_INFO VALUES ('1703', '610000', '陕西省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('1704', '610100', '西安市', '2', '610000', null, '1');
INSERT INTO AREA_INFO VALUES ('1705', '610101', '市辖区', '3', '610100', null, '1');
INSERT INTO AREA_INFO VALUES ('1706', '610102', '新城区', '3', '610100', null, '1');
INSERT INTO AREA_INFO VALUES ('1707', '610103', '碑林区', '3', '610100', null, '1');
INSERT INTO AREA_INFO VALUES ('1708', '610104', '莲湖区', '3', '610100', null, '1');
INSERT INTO AREA_INFO VALUES ('1709', '610111', '灞桥区', '3', '610100', null, '1');
INSERT INTO AREA_INFO VALUES ('1710', '610112', '未央区', '3', '610100', null, '1');
INSERT INTO AREA_INFO VALUES ('1711', '610113', '雁塔区', '3', '610100', null, '1');
INSERT INTO AREA_INFO VALUES ('1712', '610114', '阎良区', '3', '610100', null, '1');
INSERT INTO AREA_INFO VALUES ('1713', '610115', '临潼区', '3', '610100', null, '1');
INSERT INTO AREA_INFO VALUES ('1714', '610116', '长安区', '3', '610100', null, '1');
INSERT INTO AREA_INFO VALUES ('1715', '610122', '蓝田县', '3', '610100', null, '1');
INSERT INTO AREA_INFO VALUES ('1716', '610124', '周至县', '3', '610100', null, '1');
INSERT INTO AREA_INFO VALUES ('1717', '610125', '户县', '3', '610100', null, '1');
INSERT INTO AREA_INFO VALUES ('1718', '610126', '高陵县', '3', '610100', null, '1');
INSERT INTO AREA_INFO VALUES ('1719', '610200', '铜川市', '2', '610000', null, '1');
INSERT INTO AREA_INFO VALUES ('1720', '610201', '市辖区', '3', '610200', null, '1');
INSERT INTO AREA_INFO VALUES ('1721', '610202', '王益区', '3', '610200', null, '1');
INSERT INTO AREA_INFO VALUES ('1722', '610203', '印台区', '3', '610200', null, '1');
INSERT INTO AREA_INFO VALUES ('1723', '610204', '耀州区', '3', '610200', null, '1');
INSERT INTO AREA_INFO VALUES ('1724', '610222', '宜君县', '3', '610200', null, '1');
INSERT INTO AREA_INFO VALUES ('1725', '610300', '宝鸡市', '2', '610000', null, '1');
INSERT INTO AREA_INFO VALUES ('1726', '610301', '市辖区', '3', '610300', null, '1');
INSERT INTO AREA_INFO VALUES ('1727', '610302', '渭滨区', '3', '610300', null, '1');
INSERT INTO AREA_INFO VALUES ('1728', '610303', '金台区', '3', '610300', null, '1');
INSERT INTO AREA_INFO VALUES ('1729', '610304', '陈仓区', '3', '610300', null, '1');
INSERT INTO AREA_INFO VALUES ('1730', '610322', '凤翔县', '3', '610300', null, '1');
INSERT INTO AREA_INFO VALUES ('1731', '610323', '岐山县', '3', '610300', null, '1');
INSERT INTO AREA_INFO VALUES ('1732', '610324', '扶风县', '3', '610300', null, '1');
INSERT INTO AREA_INFO VALUES ('1733', '610326', '眉县', '3', '610300', null, '1');
INSERT INTO AREA_INFO VALUES ('1734', '610327', '陇县', '3', '610300', null, '1');
INSERT INTO AREA_INFO VALUES ('1735', '610330', '凤县', '3', '610300', null, '1');
INSERT INTO AREA_INFO VALUES ('1736', '610331', '太白县', '3', '610300', null, '1');
INSERT INTO AREA_INFO VALUES ('1737', '610400', '咸阳市', '2', '610000', null, '1');
INSERT INTO AREA_INFO VALUES ('1738', '610401', '市辖区', '3', '610400', null, '1');
INSERT INTO AREA_INFO VALUES ('1739', '610402', '秦都区', '3', '610400', null, '1');
INSERT INTO AREA_INFO VALUES ('1740', '610403', '杨凌区', '3', '610400', null, '1');
INSERT INTO AREA_INFO VALUES ('1741', '610404', '渭城区', '3', '610400', null, '1');
INSERT INTO AREA_INFO VALUES ('1742', '610422', '三原县', '3', '610400', null, '1');
INSERT INTO AREA_INFO VALUES ('1743', '610423', '泾阳县', '3', '610400', null, '1');
INSERT INTO AREA_INFO VALUES ('1744', '610424', '乾县', '3', '610400', null, '1');
INSERT INTO AREA_INFO VALUES ('1745', '610425', '礼泉县', '3', '610400', null, '1');
INSERT INTO AREA_INFO VALUES ('1746', '610426', '永寿县', '3', '610400', null, '1');
INSERT INTO AREA_INFO VALUES ('1747', '610427', '彬县', '3', '610400', null, '1');
INSERT INTO AREA_INFO VALUES ('1748', '610802', '榆阳区', '3', '610800', null, '1');
INSERT INTO AREA_INFO VALUES ('1749', '610821', '神木县', '3', '610800', null, '1');
INSERT INTO AREA_INFO VALUES ('1750', '610822', '府谷县', '3', '610800', null, '1');
INSERT INTO AREA_INFO VALUES ('1751', '610823', '横山县', '3', '610800', null, '1');
INSERT INTO AREA_INFO VALUES ('1752', '610824', '靖边县', '3', '610800', null, '1');
INSERT INTO AREA_INFO VALUES ('1753', '610921', '汉阴县', '3', '610900', null, '1');
INSERT INTO AREA_INFO VALUES ('1754', '610922', '石泉县', '3', '610900', null, '1');
INSERT INTO AREA_INFO VALUES ('1755', '231003', '阳明区', '3', '231000', null, '1');
INSERT INTO AREA_INFO VALUES ('1756', '231004', '爱民区', '3', '231000', null, '1');
INSERT INTO AREA_INFO VALUES ('1757', '231005', '西安区', '3', '231000', null, '1');
INSERT INTO AREA_INFO VALUES ('1758', '231024', '东宁县', '3', '231000', null, '1');
INSERT INTO AREA_INFO VALUES ('1759', '231025', '林口县', '3', '231000', null, '1');
INSERT INTO AREA_INFO VALUES ('1760', '231081', '绥芬河市', '3', '231000', null, '1');
INSERT INTO AREA_INFO VALUES ('1761', '231083', '海林市', '3', '231000', null, '1');
INSERT INTO AREA_INFO VALUES ('1762', '231084', '宁安市', '3', '231000', null, '1');
INSERT INTO AREA_INFO VALUES ('1763', '231085', '穆棱市', '3', '231000', null, '1');
INSERT INTO AREA_INFO VALUES ('1764', '231100', '黑河市', '2', '230000', null, '1');
INSERT INTO AREA_INFO VALUES ('1765', '231101', '市辖区', '3', '231100', null, '1');
INSERT INTO AREA_INFO VALUES ('1766', '231102', '爱辉区', '3', '231100', null, '1');
INSERT INTO AREA_INFO VALUES ('1767', '231121', '嫩江县', '3', '231100', null, '1');
INSERT INTO AREA_INFO VALUES ('1768', '231123', '逊克县', '3', '231100', null, '1');
INSERT INTO AREA_INFO VALUES ('1769', '231124', '孙吴县', '3', '231100', null, '1');
INSERT INTO AREA_INFO VALUES ('1770', '231181', '北安市', '3', '231100', null, '1');
INSERT INTO AREA_INFO VALUES ('1771', '231182', '五大连池市', '3', '231100', null, '1');
INSERT INTO AREA_INFO VALUES ('1772', '231200', '绥化市', '2', '230000', null, '1');
INSERT INTO AREA_INFO VALUES ('1773', '231201', '市辖区', '3', '231200', null, '1');
INSERT INTO AREA_INFO VALUES ('1178', '211122', '盘山县', '3', '211100', null, '1');
INSERT INTO AREA_INFO VALUES ('1179', '211200', '铁岭市', '2', '210000', null, '1');
INSERT INTO AREA_INFO VALUES ('1180', '211201', '市辖区', '3', '211200', null, '1');
INSERT INTO AREA_INFO VALUES ('1181', '211202', '银州区', '3', '211200', null, '1');
INSERT INTO AREA_INFO VALUES ('1182', '211204', '清河区', '3', '211200', null, '1');
INSERT INTO AREA_INFO VALUES ('1183', '211221', '铁岭县', '3', '211200', null, '1');
INSERT INTO AREA_INFO VALUES ('1184', '211223', '西丰县', '3', '211200', null, '1');
INSERT INTO AREA_INFO VALUES ('1185', '211224', '昌图县', '3', '211200', null, '1');
INSERT INTO AREA_INFO VALUES ('1186', '211281', '调兵山市', '3', '211200', null, '1');
INSERT INTO AREA_INFO VALUES ('1187', '211282', '开原市', '3', '211200', null, '1');
INSERT INTO AREA_INFO VALUES ('1188', '211300', '朝阳市', '2', '210000', null, '1');
INSERT INTO AREA_INFO VALUES ('1189', '211301', '市辖区', '3', '211300', null, '1');
INSERT INTO AREA_INFO VALUES ('1190', '211302', '双塔区', '3', '211300', null, '1');
INSERT INTO AREA_INFO VALUES ('1191', '211303', '龙城区', '3', '211300', null, '1');
INSERT INTO AREA_INFO VALUES ('1192', '211321', '朝阳县', '3', '211300', null, '1');
INSERT INTO AREA_INFO VALUES ('1193', '211322', '建平县', '3', '211300', null, '1');
INSERT INTO AREA_INFO VALUES ('1194', '211381', '北票市', '3', '211300', null, '1');
INSERT INTO AREA_INFO VALUES ('1195', '211382', '凌源市', '3', '211300', null, '1');
INSERT INTO AREA_INFO VALUES ('1196', '211400', '葫芦岛市', '2', '210000', null, '1');
INSERT INTO AREA_INFO VALUES ('1197', '211401', '市辖区', '3', '211400', null, '1');
INSERT INTO AREA_INFO VALUES ('1198', '211402', '连山区', '3', '211400', null, '1');
INSERT INTO AREA_INFO VALUES ('1199', '211403', '龙港区', '3', '211400', null, '1');
INSERT INTO AREA_INFO VALUES ('1200', '211404', '南票区', '3', '211400', null, '1');
INSERT INTO AREA_INFO VALUES ('1201', '211421', '绥中县', '3', '211400', null, '1');
INSERT INTO AREA_INFO VALUES ('1202', '211422', '建昌县', '3', '211400', null, '1');
INSERT INTO AREA_INFO VALUES ('1203', '211481', '兴城市', '3', '211400', null, '1');
INSERT INTO AREA_INFO VALUES ('1204', '220000', '吉林省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('1205', '220100', '长春市', '2', '220000', null, '1');
INSERT INTO AREA_INFO VALUES ('1206', '220101', '市辖区', '3', '220100', null, '1');
INSERT INTO AREA_INFO VALUES ('1207', '220102', '南关区', '3', '220100', null, '1');
INSERT INTO AREA_INFO VALUES ('1208', '220103', '宽城区', '3', '220100', null, '1');
INSERT INTO AREA_INFO VALUES ('1209', '220104', '朝阳区', '3', '220100', null, '1');
INSERT INTO AREA_INFO VALUES ('1210', '220105', '二道区', '3', '220100', null, '1');
INSERT INTO AREA_INFO VALUES ('1211', '220106', '绿园区', '3', '220100', null, '1');
INSERT INTO AREA_INFO VALUES ('1212', '220112', '双阳区', '3', '220100', null, '1');
INSERT INTO AREA_INFO VALUES ('1213', '220122', '农安县', '3', '220100', null, '1');
INSERT INTO AREA_INFO VALUES ('1214', '220181', '九台市', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1215', '220182', '榆树市', '3', '220100', null, '1');
INSERT INTO AREA_INFO VALUES ('1216', '220183', '德惠市', '3', '220100', null, '1');
INSERT INTO AREA_INFO VALUES ('1217', '220200', '吉林市', '2', '220000', null, '1');
INSERT INTO AREA_INFO VALUES ('1218', '220201', '市辖区', '3', '220200', null, '1');
INSERT INTO AREA_INFO VALUES ('1219', '220202', '昌邑区', '3', '220200', null, '1');
INSERT INTO AREA_INFO VALUES ('1220', '220203', '龙潭区', '3', '220200', null, '1');
INSERT INTO AREA_INFO VALUES ('1221', '220204', '船营区', '3', '220200', null, '1');
INSERT INTO AREA_INFO VALUES ('1222', '220211', '丰满区', '3', '220200', null, '1');
INSERT INTO AREA_INFO VALUES ('1223', '220221', '永吉县', '3', '220200', null, '1');
INSERT INTO AREA_INFO VALUES ('1224', '220281', '蛟河市', '3', '220200', null, '1');
INSERT INTO AREA_INFO VALUES ('1225', '220282', '桦甸市', '3', '220200', null, '1');
INSERT INTO AREA_INFO VALUES ('1226', '220283', '舒兰市', '3', '220200', null, '1');
INSERT INTO AREA_INFO VALUES ('1227', '220284', '磐石市', '3', '220200', null, '1');
INSERT INTO AREA_INFO VALUES ('1228', '220300', '四平市', '2', '220000', null, '1');
INSERT INTO AREA_INFO VALUES ('1229', '220301', '市辖区', '3', '220300', null, '1');
INSERT INTO AREA_INFO VALUES ('1230', '220302', '铁西区', '3', '220300', null, '1');
INSERT INTO AREA_INFO VALUES ('1231', '220303', '铁东区', '3', '220300', null, '1');
INSERT INTO AREA_INFO VALUES ('1232', '220322', '梨树县', '3', '220300', null, '1');
INSERT INTO AREA_INFO VALUES ('1233', '220323', '伊通满族自治县', '3', '220300', null, '1');
INSERT INTO AREA_INFO VALUES ('1234', '220381', '公主岭市', '3', '220300', null, '1');
INSERT INTO AREA_INFO VALUES ('1235', '220382', '双辽市', '3', '220300', null, '1');
INSERT INTO AREA_INFO VALUES ('1236', '220400', '辽源市', '2', '220000', null, '1');
INSERT INTO AREA_INFO VALUES ('1237', '220401', '市辖区', '3', '220400', null, '1');
INSERT INTO AREA_INFO VALUES ('1238', '220402', '龙山区', '3', '220400', null, '1');
INSERT INTO AREA_INFO VALUES ('1239', '220403', '西安区', '3', '220400', null, '1');
INSERT INTO AREA_INFO VALUES ('1240', '220421', '东丰县', '3', '220400', null, '1');
INSERT INTO AREA_INFO VALUES ('1241', '220422', '东辽县', '3', '220400', null, '1');
INSERT INTO AREA_INFO VALUES ('1242', '220500', '通化市', '2', '220000', null, '1');
INSERT INTO AREA_INFO VALUES ('1243', '220501', '市辖区', '3', '220500', null, '1');
INSERT INTO AREA_INFO VALUES ('1244', '220502', '东昌区', '3', '220500', null, '1');
INSERT INTO AREA_INFO VALUES ('1245', '220503', '二道江区', '3', '220500', null, '1');
INSERT INTO AREA_INFO VALUES ('1246', '220521', '通化县', '3', '220500', null, '1');
INSERT INTO AREA_INFO VALUES ('1247', '220523', '辉南县', '3', '220500', null, '1');
INSERT INTO AREA_INFO VALUES ('1248', '220524', '柳河县', '3', '220500', null, '1');
INSERT INTO AREA_INFO VALUES ('1249', '220581', '梅河口市', '3', '220500', null, '1');
INSERT INTO AREA_INFO VALUES ('1250', '220582', '集安市', '3', '220500', null, '1');
INSERT INTO AREA_INFO VALUES ('1251', '220600', '白山市', '2', '220000', null, '1');
INSERT INTO AREA_INFO VALUES ('1252', '220601', '市辖区', '3', '220600', null, '1');
INSERT INTO AREA_INFO VALUES ('1253', '220602', '八道江区', '3', '220600', null, '1');
INSERT INTO AREA_INFO VALUES ('1254', '220604', '江源区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1255', '220621', '抚松县', '3', '220600', null, '1');
INSERT INTO AREA_INFO VALUES ('1256', '220622', '靖宇县', '3', '220600', null, '1');
INSERT INTO AREA_INFO VALUES ('1257', '220623', '长白朝鲜族自治县', '3', '220600', null, '1');
INSERT INTO AREA_INFO VALUES ('1258', '220681', '临江市', '3', '220600', null, '1');
INSERT INTO AREA_INFO VALUES ('1259', '220700', '松原市', '2', '220000', null, '1');
INSERT INTO AREA_INFO VALUES ('1260', '220701', '市辖区', '3', '220700', null, '1');
INSERT INTO AREA_INFO VALUES ('1261', '220702', '宁江区', '3', '220700', null, '1');
INSERT INTO AREA_INFO VALUES ('1262', '220722', '长岭县', '3', '220700', null, '1');
INSERT INTO AREA_INFO VALUES ('1263', '220723', '乾安县', '3', '220700', null, '1');
INSERT INTO AREA_INFO VALUES ('1264', '220724', '扶余县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1265', '370406', '山亭区', '3', '370400', null, '1');
INSERT INTO AREA_INFO VALUES ('1266', '370481', '滕州市', '3', '370400', null, '1');
INSERT INTO AREA_INFO VALUES ('1267', '370500', '东营市', '2', '370000', null, '1');
INSERT INTO AREA_INFO VALUES ('1268', '370501', '市辖区', '3', '370500', null, '1');
INSERT INTO AREA_INFO VALUES ('1269', '370502', '东营区', '3', '370500', null, '1');
INSERT INTO AREA_INFO VALUES ('1270', '370503', '河口区', '3', '370500', null, '1');
INSERT INTO AREA_INFO VALUES ('1271', '370521', '垦利县', '3', '370500', null, '1');
INSERT INTO AREA_INFO VALUES ('1272', '370522', '利津县', '3', '370500', null, '1');
INSERT INTO AREA_INFO VALUES ('1273', '370523', '广饶县', '3', '370500', null, '1');
INSERT INTO AREA_INFO VALUES ('1274', '370687', '海阳市', '3', '370600', null, '1');
INSERT INTO AREA_INFO VALUES ('1275', '370700', '潍坊市', '2', '370000', null, '1');
INSERT INTO AREA_INFO VALUES ('1276', '370701', '市辖区', '3', '370700', null, '1');
INSERT INTO AREA_INFO VALUES ('1277', '370702', '潍城区', '3', '370700', null, '1');
INSERT INTO AREA_INFO VALUES ('1278', '370703', '寒亭区', '3', '370700', null, '1');
INSERT INTO AREA_INFO VALUES ('1279', '370704', '坊子区', '3', '370700', null, '1');
INSERT INTO AREA_INFO VALUES ('1280', '370705', '奎文区', '3', '370700', null, '1');
INSERT INTO AREA_INFO VALUES ('1281', '370724', '临朐县', '3', '370700', null, '1');
INSERT INTO AREA_INFO VALUES ('1282', '370725', '昌乐县', '3', '370700', null, '1');
INSERT INTO AREA_INFO VALUES ('1283', '370781', '青州市', '3', '370700', null, '1');
INSERT INTO AREA_INFO VALUES ('1284', '370782', '诸城市', '3', '370700', null, '1');
INSERT INTO AREA_INFO VALUES ('1285', '370783', '寿光市', '3', '370700', null, '1');
INSERT INTO AREA_INFO VALUES ('1286', '370784', '安丘市', '3', '370700', null, '1');
INSERT INTO AREA_INFO VALUES ('1287', '370785', '高密市', '3', '370700', null, '1');
INSERT INTO AREA_INFO VALUES ('1288', '370829', '嘉祥县', '3', '370800', null, '1');
INSERT INTO AREA_INFO VALUES ('1289', '370830', '汶上县', '3', '370800', null, '1');
INSERT INTO AREA_INFO VALUES ('1290', '370831', '泗水县', '3', '370800', null, '1');
INSERT INTO AREA_INFO VALUES ('1291', '370832', '梁山县', '3', '370800', null, '1');
INSERT INTO AREA_INFO VALUES ('1292', '370881', '曲阜市', '3', '370800', null, '1');
INSERT INTO AREA_INFO VALUES ('1293', '370882', '兖州市', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1294', '371083', '乳山市', '3', '371000', null, '1');
INSERT INTO AREA_INFO VALUES ('1295', '371100', '日照市', '2', '370000', null, '1');
INSERT INTO AREA_INFO VALUES ('1296', '371101', '市辖区', '3', '371100', null, '1');
INSERT INTO AREA_INFO VALUES ('1297', '371102', '东港区', '3', '371100', null, '1');
INSERT INTO AREA_INFO VALUES ('1298', '371103', '岚山区', '3', '371100', null, '1');
INSERT INTO AREA_INFO VALUES ('1299', '371121', '五莲县', '3', '371100', null, '1');
INSERT INTO AREA_INFO VALUES ('1300', '371122', '莒县', '3', '371100', null, '1');
INSERT INTO AREA_INFO VALUES ('1301', '371200', '莱芜市', '2', '370000', null, '1');
INSERT INTO AREA_INFO VALUES ('1302', '371201', '市辖区', '3', '371200', null, '1');
INSERT INTO AREA_INFO VALUES ('1303', '371202', '莱城区', '3', '371200', null, '1');
INSERT INTO AREA_INFO VALUES ('1304', '371203', '钢城区', '3', '371200', null, '1');
INSERT INTO AREA_INFO VALUES ('1305', '371300', '临沂市', '2', '370000', null, '1');
INSERT INTO AREA_INFO VALUES ('1306', '371301', '市辖区', '3', '371300', null, '1');
INSERT INTO AREA_INFO VALUES ('1307', '371302', '兰山区', '3', '371300', null, '1');
INSERT INTO AREA_INFO VALUES ('1308', '371311', '罗庄区', '3', '371300', null, '1');
INSERT INTO AREA_INFO VALUES ('1309', '371312', '河东区', '3', '371300', null, '1');
INSERT INTO AREA_INFO VALUES ('1310', '371321', '沂南县', '3', '371300', null, '1');
INSERT INTO AREA_INFO VALUES ('1311', '371322', '郯城县', '3', '371300', null, '1');
INSERT INTO AREA_INFO VALUES ('1312', '371323', '沂水县', '3', '371300', null, '1');
INSERT INTO AREA_INFO VALUES ('1313', '371324', '苍山县', '3', '371300', null, '1');
INSERT INTO AREA_INFO VALUES ('1314', '371325', '费县', '3', '371300', null, '1');
INSERT INTO AREA_INFO VALUES ('1315', '371326', '平邑县', '3', '371300', null, '1');
INSERT INTO AREA_INFO VALUES ('1316', '371327', '莒南县', '3', '371300', null, '1');
INSERT INTO AREA_INFO VALUES ('1317', '371328', '蒙阴县', '3', '371300', null, '1');
INSERT INTO AREA_INFO VALUES ('1318', '371329', '临沭县', '3', '371300', null, '1');
INSERT INTO AREA_INFO VALUES ('1319', '371400', '德州市', '2', '370000', null, '1');
INSERT INTO AREA_INFO VALUES ('1320', '371401', '市辖区', '3', '371400', null, '1');
INSERT INTO AREA_INFO VALUES ('1321', '371402', '德城区', '3', '371400', null, '1');
INSERT INTO AREA_INFO VALUES ('1322', '371421', '陵县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('1323', '371422', '宁津县', '3', '371400', null, '1');
INSERT INTO AREA_INFO VALUES ('1324', '371423', '庆云县', '3', '371400', null, '1');
INSERT INTO AREA_INFO VALUES ('1325', '371501', '市辖区', '3', '371500', null, '1');
INSERT INTO AREA_INFO VALUES ('1326', '371502', '东昌府区', '3', '371500', null, '1');
INSERT INTO AREA_INFO VALUES ('736', '430105', '开福区', '3', '430100', null, '1');
INSERT INTO AREA_INFO VALUES ('737', '430111', '雨花区', '3', '430100', null, '1');
INSERT INTO AREA_INFO VALUES ('738', '430121', '长沙县', '3', '430100', null, '1');
INSERT INTO AREA_INFO VALUES ('739', '430122', '望城县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('740', '430124', '宁乡县', '3', '430100', null, '1');
INSERT INTO AREA_INFO VALUES ('741', '430181', '浏阳市', '3', '430100', null, '1');
INSERT INTO AREA_INFO VALUES ('742', '430200', '株洲市', '2', '430000', null, '1');
INSERT INTO AREA_INFO VALUES ('743', '430201', '市辖区', '3', '430200', null, '1');
INSERT INTO AREA_INFO VALUES ('744', '430202', '荷塘区', '3', '430200', null, '1');
INSERT INTO AREA_INFO VALUES ('745', '430203', '芦淞区', '3', '430200', null, '1');
INSERT INTO AREA_INFO VALUES ('746', '430204', '石峰区', '3', '430200', null, '1');
INSERT INTO AREA_INFO VALUES ('747', '430211', '天元区', '3', '430200', null, '1');
INSERT INTO AREA_INFO VALUES ('748', '430221', '株洲县', '3', '430200', null, '1');
INSERT INTO AREA_INFO VALUES ('749', '430223', '攸县', '3', '430200', null, '1');
INSERT INTO AREA_INFO VALUES ('750', '430224', '茶陵县', '3', '430200', null, '1');
INSERT INTO AREA_INFO VALUES ('751', '430225', '炎陵县', '3', '430200', null, '1');
INSERT INTO AREA_INFO VALUES ('752', '430281', '醴陵市', '3', '430200', null, '1');
INSERT INTO AREA_INFO VALUES ('753', '430300', '湘潭市', '2', '430000', null, '1');
INSERT INTO AREA_INFO VALUES ('754', '430301', '市辖区', '3', '430300', null, '1');
INSERT INTO AREA_INFO VALUES ('755', '430302', '雨湖区', '3', '430300', null, '1');
INSERT INTO AREA_INFO VALUES ('756', '430304', '岳塘区', '3', '430300', null, '1');
INSERT INTO AREA_INFO VALUES ('757', '430321', '湘潭县', '3', '430300', null, '1');
INSERT INTO AREA_INFO VALUES ('758', '430381', '湘乡市', '3', '430300', null, '1');
INSERT INTO AREA_INFO VALUES ('759', '430382', '韶山市', '3', '430300', null, '1');
INSERT INTO AREA_INFO VALUES ('760', '431103', '冷水滩区', '3', '431100', null, '1');
INSERT INTO AREA_INFO VALUES ('761', '431121', '祁阳县', '3', '431100', null, '1');
INSERT INTO AREA_INFO VALUES ('762', '431122', '东安县', '3', '431100', null, '1');
INSERT INTO AREA_INFO VALUES ('763', '431123', '双牌县', '3', '431100', null, '1');
INSERT INTO AREA_INFO VALUES ('764', '431124', '道县', '3', '431100', null, '1');
INSERT INTO AREA_INFO VALUES ('765', '431125', '江永县', '3', '431100', null, '1');
INSERT INTO AREA_INFO VALUES ('766', '431126', '宁远县', '3', '431100', null, '1');
INSERT INTO AREA_INFO VALUES ('767', '431127', '蓝山县', '3', '431100', null, '1');
INSERT INTO AREA_INFO VALUES ('768', '431128', '新田县', '3', '431100', null, '1');
INSERT INTO AREA_INFO VALUES ('769', '431129', '江华瑶族自治县', '3', '431100', null, '1');
INSERT INTO AREA_INFO VALUES ('770', '431200', '怀化市', '2', '430000', null, '1');
INSERT INTO AREA_INFO VALUES ('771', '431201', '市辖区', '3', '431200', null, '1');
INSERT INTO AREA_INFO VALUES ('772', '431202', '鹤城区', '3', '431200', null, '1');
INSERT INTO AREA_INFO VALUES ('773', '431221', '中方县', '3', '431200', null, '1');
INSERT INTO AREA_INFO VALUES ('774', '431222', '沅陵县', '3', '431200', null, '1');
INSERT INTO AREA_INFO VALUES ('775', '431223', '辰溪县', '3', '431200', null, '1');
INSERT INTO AREA_INFO VALUES ('776', '431224', '溆浦县', '3', '431200', null, '1');
INSERT INTO AREA_INFO VALUES ('777', '431225', '会同县', '3', '431200', null, '1');
INSERT INTO AREA_INFO VALUES ('778', '431226', '麻阳苗族自治县', '3', '431200', null, '1');
INSERT INTO AREA_INFO VALUES ('779', '431227', '新晃侗族自治县', '3', '431200', null, '1');
INSERT INTO AREA_INFO VALUES ('780', '431228', '芷江侗族自治县', '3', '431200', null, '1');
INSERT INTO AREA_INFO VALUES ('781', '431229', '靖州苗族侗族自治县', '3', '431200', null, '1');
INSERT INTO AREA_INFO VALUES ('782', '433125', '保靖县', '3', '433100', null, '1');
INSERT INTO AREA_INFO VALUES ('783', '433126', '古丈县', '3', '433100', null, '1');
INSERT INTO AREA_INFO VALUES ('784', '433127', '永顺县', '3', '433100', null, '1');
INSERT INTO AREA_INFO VALUES ('785', '440000', '广东省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('786', '440100', '广州市', '2', '440000', null, '1');
INSERT INTO AREA_INFO VALUES ('787', '440101', '市辖区', '3', '440100', null, '1');
INSERT INTO AREA_INFO VALUES ('788', '440102', '东山区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('789', '440103', '荔湾区', '3', '440100', null, '1');
INSERT INTO AREA_INFO VALUES ('790', '440104', '越秀区', '3', '440100', null, '1');
INSERT INTO AREA_INFO VALUES ('791', '440105', '海珠区', '3', '440100', null, '1');
INSERT INTO AREA_INFO VALUES ('792', '440106', '天河区', '3', '440100', null, '1');
INSERT INTO AREA_INFO VALUES ('793', '440111', '白云区', '3', '440100', null, '1');
INSERT INTO AREA_INFO VALUES ('794', '440112', '黄埔区', '3', '440100', null, '1');
INSERT INTO AREA_INFO VALUES ('795', '440113', '番禺区', '3', '440100', null, '1');
INSERT INTO AREA_INFO VALUES ('796', '440114', '花都区', '3', '440100', null, '1');
INSERT INTO AREA_INFO VALUES ('797', '440201', '市辖区', '3', '440200', null, '1');
INSERT INTO AREA_INFO VALUES ('798', '440203', '武江区', '3', '440200', null, '1');
INSERT INTO AREA_INFO VALUES ('799', '440204', '浈江区', '3', '440200', null, '1');
INSERT INTO AREA_INFO VALUES ('800', '440229', '翁源县', '3', '440200', null, '1');
INSERT INTO AREA_INFO VALUES ('801', '440232', '乳源瑶族自治县', '3', '440200', null, '1');
INSERT INTO AREA_INFO VALUES ('802', '440233', '新丰县', '3', '440200', null, '1');
INSERT INTO AREA_INFO VALUES ('803', '440281', '乐昌市', '3', '440200', null, '1');
INSERT INTO AREA_INFO VALUES ('804', '440282', '南雄市', '3', '440200', null, '1');
INSERT INTO AREA_INFO VALUES ('805', '440300', '深圳市', '2', '440000', null, '1');
INSERT INTO AREA_INFO VALUES ('806', '652700', '博尔塔拉蒙古自治州', '2', '650000', null, '1');
INSERT INTO AREA_INFO VALUES ('807', '652701', '博乐市', '3', '652700', null, '1');
INSERT INTO AREA_INFO VALUES ('808', '652801', '库尔勒市', '3', '652800', null, '1');
INSERT INTO AREA_INFO VALUES ('809', '652822', '轮台县', '3', '652800', null, '1');
INSERT INTO AREA_INFO VALUES ('810', '652823', '尉犁县', '3', '652800', null, '1');
INSERT INTO AREA_INFO VALUES ('811', '652824', '若羌县', '3', '652800', null, '1');
INSERT INTO AREA_INFO VALUES ('812', '652825', '且末县', '3', '652800', null, '1');
INSERT INTO AREA_INFO VALUES ('813', '652826', '焉耆回族自治县', '3', '652800', null, '1');
INSERT INTO AREA_INFO VALUES ('814', '652827', '和静县', '3', '652800', null, '1');
INSERT INTO AREA_INFO VALUES ('815', '652828', '和硕县', '3', '652800', null, '1');
INSERT INTO AREA_INFO VALUES ('816', '652829', '博湖县', '3', '652800', null, '1');
INSERT INTO AREA_INFO VALUES ('817', '652900', '阿克苏地区', '2', '650000', null, '1');
INSERT INTO AREA_INFO VALUES ('818', '652901', '阿克苏市', '3', '652900', null, '1');
INSERT INTO AREA_INFO VALUES ('819', '652922', '温宿县', '3', '652900', null, '1');
INSERT INTO AREA_INFO VALUES ('820', '652923', '库车县', '3', '652900', null, '1');
INSERT INTO AREA_INFO VALUES ('821', '652924', '沙雅县', '3', '652900', null, '1');
INSERT INTO AREA_INFO VALUES ('822', '652925', '新和县', '3', '652900', null, '1');
INSERT INTO AREA_INFO VALUES ('823', '652926', '拜城县', '3', '652900', null, '1');
INSERT INTO AREA_INFO VALUES ('824', '652927', '乌什县', '3', '652900', null, '1');
INSERT INTO AREA_INFO VALUES ('825', '653001', '阿图什市', '3', '653000', null, '1');
INSERT INTO AREA_INFO VALUES ('826', '653022', '阿克陶县', '3', '653000', null, '1');
INSERT INTO AREA_INFO VALUES ('827', '653023', '阿合奇县', '3', '653000', null, '1');
INSERT INTO AREA_INFO VALUES ('828', '653024', '乌恰县', '3', '653000', null, '1');
INSERT INTO AREA_INFO VALUES ('829', '653100', '喀什地区', '2', '650000', null, '1');
INSERT INTO AREA_INFO VALUES ('830', '653101', '喀什市', '3', '653100', null, '1');
INSERT INTO AREA_INFO VALUES ('831', '653121', '疏附县', '3', '653100', null, '1');
INSERT INTO AREA_INFO VALUES ('832', '653122', '疏勒县', '3', '653100', null, '1');
INSERT INTO AREA_INFO VALUES ('833', '653123', '英吉沙县', '3', '653100', null, '1');
INSERT INTO AREA_INFO VALUES ('834', '653124', '泽普县', '3', '653100', null, '1');
INSERT INTO AREA_INFO VALUES ('835', '653125', '莎车县', '3', '653100', null, '1');
INSERT INTO AREA_INFO VALUES ('836', '653126', '叶城县', '3', '653100', null, '1');
INSERT INTO AREA_INFO VALUES ('837', '653127', '麦盖提县', '3', '653100', null, '1');
INSERT INTO AREA_INFO VALUES ('838', '653128', '岳普湖县', '3', '653100', null, '1');
INSERT INTO AREA_INFO VALUES ('839', '653129', '伽师县', '3', '653100', null, '1');
INSERT INTO AREA_INFO VALUES ('840', '653130', '巴楚县', '3', '653100', null, '1');
INSERT INTO AREA_INFO VALUES ('841', '653200', '和田地区', '2', '650000', null, '1');
INSERT INTO AREA_INFO VALUES ('842', '653201', '和田市', '3', '653200', null, '1');
INSERT INTO AREA_INFO VALUES ('843', '653221', '和田县', '3', '653200', null, '1');
INSERT INTO AREA_INFO VALUES ('844', '653222', '墨玉县', '3', '653200', null, '1');
INSERT INTO AREA_INFO VALUES ('845', '653223', '皮山县', '3', '653200', null, '1');
INSERT INTO AREA_INFO VALUES ('846', '653224', '洛浦县', '3', '653200', null, '1');
INSERT INTO AREA_INFO VALUES ('847', '653225', '策勒县', '3', '653200', null, '1');
INSERT INTO AREA_INFO VALUES ('848', '653226', '于田县', '3', '653200', null, '1');
INSERT INTO AREA_INFO VALUES ('849', '653227', '民丰县', '3', '653200', null, '1');
INSERT INTO AREA_INFO VALUES ('850', '654000', '伊犁哈萨克自治州', '2', '650000', null, '1');
INSERT INTO AREA_INFO VALUES ('851', '654002', '伊宁市', '3', '654000', null, '1');
INSERT INTO AREA_INFO VALUES ('852', '654003', '奎屯市', '3', '654000', null, '1');
INSERT INTO AREA_INFO VALUES ('853', '654021', '伊宁县', '3', '654000', null, '1');
INSERT INTO AREA_INFO VALUES ('854', '654022', '察布查尔锡伯自治县', '3', '654000', null, '1');
INSERT INTO AREA_INFO VALUES ('855', '654023', '霍城县', '3', '654000', null, '1');
INSERT INTO AREA_INFO VALUES ('856', '654024', '巩留县', '3', '654000', null, '1');
INSERT INTO AREA_INFO VALUES ('857', '654025', '新源县', '3', '654000', null, '1');
INSERT INTO AREA_INFO VALUES ('858', '654026', '昭苏县', '3', '654000', null, '1');
INSERT INTO AREA_INFO VALUES ('859', '654027', '特克斯县', '3', '654000', null, '1');
INSERT INTO AREA_INFO VALUES ('860', '654028', '尼勒克县', '3', '654000', null, '1');
INSERT INTO AREA_INFO VALUES ('861', '654200', '塔城地区', '2', '650000', null, '1');
INSERT INTO AREA_INFO VALUES ('862', '654201', '塔城市', '3', '654200', null, '1');
INSERT INTO AREA_INFO VALUES ('863', '654226', '和布克赛尔蒙古自治县', '3', '654200', null, '1');
INSERT INTO AREA_INFO VALUES ('864', '654300', '阿勒泰地区', '2', '650000', null, '1');
INSERT INTO AREA_INFO VALUES ('865', '654301', '阿勒泰市', '3', '654300', null, '1');
INSERT INTO AREA_INFO VALUES ('866', '654321', '布尔津县', '3', '654300', null, '1');
INSERT INTO AREA_INFO VALUES ('867', '654322', '富蕴县', '3', '654300', null, '1');
INSERT INTO AREA_INFO VALUES ('868', '654325', '青河县', '3', '654300', null, '1');
INSERT INTO AREA_INFO VALUES ('869', '654326', '吉木乃县', '3', '654300', null, '1');
INSERT INTO AREA_INFO VALUES ('870', '659000', '省直辖行政单位', '2', '650000', null, '1');
INSERT INTO AREA_INFO VALUES ('871', '659001', '石河子市', '3', '659000', null, '1');
INSERT INTO AREA_INFO VALUES ('872', '659002', '阿拉尔市', '3', '659000', null, '1');
INSERT INTO AREA_INFO VALUES ('873', '659003', '图木舒克市', '3', '659000', null, '1');
INSERT INTO AREA_INFO VALUES ('874', '659004', '五家渠市', '3', '659000', null, '1');
INSERT INTO AREA_INFO VALUES ('875', '710000', '台湾省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('876', '350501', '市辖区', '3', '350500', null, '1');
INSERT INTO AREA_INFO VALUES ('877', '350502', '鲤城区', '3', '350500', null, '1');
INSERT INTO AREA_INFO VALUES ('878', '350503', '丰泽区', '3', '350500', null, '1');
INSERT INTO AREA_INFO VALUES ('879', '350504', '洛江区', '3', '350500', null, '1');
INSERT INTO AREA_INFO VALUES ('880', '350505', '泉港区', '3', '350500', null, '1');
INSERT INTO AREA_INFO VALUES ('881', '350521', '惠安县', '3', '350500', null, '1');
INSERT INTO AREA_INFO VALUES ('882', '350524', '安溪县', '3', '350500', null, '1');
INSERT INTO AREA_INFO VALUES ('883', '350525', '永春县', '3', '350500', null, '1');
INSERT INTO AREA_INFO VALUES ('884', '350526', '德化县', '3', '350500', null, '1');
INSERT INTO AREA_INFO VALUES ('885', '350527', '金门县', '3', '350500', null, '1');
INSERT INTO AREA_INFO VALUES ('886', '350581', '石狮市', '3', '350500', null, '1');
INSERT INTO AREA_INFO VALUES ('887', '350582', '晋江市', '3', '350500', null, '1');
INSERT INTO AREA_INFO VALUES ('888', '350583', '南安市', '3', '350500', null, '1');
INSERT INTO AREA_INFO VALUES ('889', '350600', '漳州市', '2', '350000', null, '1');
INSERT INTO AREA_INFO VALUES ('890', '350700', '南平市', '2', '350000', null, '1');
INSERT INTO AREA_INFO VALUES ('891', '350701', '市辖区', '3', '350700', null, '1');
INSERT INTO AREA_INFO VALUES ('892', '360101', '市辖区', '3', '360100', null, '1');
INSERT INTO AREA_INFO VALUES ('893', '360102', '东湖区', '3', '360100', null, '1');
INSERT INTO AREA_INFO VALUES ('894', '360103', '西湖区', '3', '360100', null, '1');
INSERT INTO AREA_INFO VALUES ('895', '360104', '青云谱区', '3', '360100', null, '1');
INSERT INTO AREA_INFO VALUES ('896', '360105', '湾里区', '3', '360100', null, '1');
INSERT INTO AREA_INFO VALUES ('897', '360111', '青山湖区', '3', '360100', null, '1');
INSERT INTO AREA_INFO VALUES ('898', '360121', '南昌县', '3', '360100', null, '1');
INSERT INTO AREA_INFO VALUES ('899', '360122', '新建县', '3', '360100', null, '1');
INSERT INTO AREA_INFO VALUES ('900', '360123', '安义县', '3', '360100', null, '1');
INSERT INTO AREA_INFO VALUES ('901', '360124', '进贤县', '3', '360100', null, '1');
INSERT INTO AREA_INFO VALUES ('902', '360302', '安源区', '3', '360300', null, '1');
INSERT INTO AREA_INFO VALUES ('903', '360313', '湘东区', '3', '360300', null, '1');
INSERT INTO AREA_INFO VALUES ('904', '360321', '莲花县', '3', '360300', null, '1');
INSERT INTO AREA_INFO VALUES ('905', '360322', '上栗县', '3', '360300', null, '1');
INSERT INTO AREA_INFO VALUES ('906', '360323', '芦溪县', '3', '360300', null, '1');
INSERT INTO AREA_INFO VALUES ('907', '360400', '九江市', '2', '360000', null, '1');
INSERT INTO AREA_INFO VALUES ('908', '360401', '市辖区', '3', '360400', null, '1');
INSERT INTO AREA_INFO VALUES ('909', '360402', '庐山区', '3', '360400', null, '1');
INSERT INTO AREA_INFO VALUES ('910', '360403', '浔阳区', '3', '360400', null, '1');
INSERT INTO AREA_INFO VALUES ('911', '360421', '九江县', '3', '360400', null, '1');
INSERT INTO AREA_INFO VALUES ('912', '360423', '武宁县', '3', '360400', null, '1');
INSERT INTO AREA_INFO VALUES ('913', '360425', '永修县', '3', '360400', null, '1');
INSERT INTO AREA_INFO VALUES ('914', '360426', '德安县', '3', '360400', null, '1');
INSERT INTO AREA_INFO VALUES ('915', '360427', '星子县', '3', '360400', null, '1');
INSERT INTO AREA_INFO VALUES ('916', '360428', '都昌县', '3', '360400', null, '1');
INSERT INTO AREA_INFO VALUES ('917', '360429', '湖口县', '3', '360400', null, '1');
INSERT INTO AREA_INFO VALUES ('918', '360430', '彭泽县', '3', '360400', null, '1');
INSERT INTO AREA_INFO VALUES ('919', '360481', '瑞昌市', '3', '360400', null, '1');
INSERT INTO AREA_INFO VALUES ('920', '360500', '新余市', '2', '360000', null, '1');
INSERT INTO AREA_INFO VALUES ('921', '360501', '市辖区', '3', '360500', null, '1');
INSERT INTO AREA_INFO VALUES ('922', '360502', '渝水区', '3', '360500', null, '1');
INSERT INTO AREA_INFO VALUES ('923', '360521', '分宜县', '3', '360500', null, '1');
INSERT INTO AREA_INFO VALUES ('924', '360600', '鹰潭市', '2', '360000', null, '1');
INSERT INTO AREA_INFO VALUES ('925', '360601', '市辖区', '3', '360600', null, '1');
INSERT INTO AREA_INFO VALUES ('926', '360722', '信丰县', '3', '360700', null, '1');
INSERT INTO AREA_INFO VALUES ('927', '360828', '万安县', '3', '360800', null, '1');
INSERT INTO AREA_INFO VALUES ('928', '360829', '安福县', '3', '360800', null, '1');
INSERT INTO AREA_INFO VALUES ('929', '370202', '市南区', '3', '370200', null, '1');
INSERT INTO AREA_INFO VALUES ('930', '370203', '市北区', '3', '370200', null, '1');
INSERT INTO AREA_INFO VALUES ('931', '370205', '四方区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('932', '370211', '黄岛区', '3', '370200', null, '1');
INSERT INTO AREA_INFO VALUES ('933', '370212', '崂山区', '3', '370200', null, '1');
INSERT INTO AREA_INFO VALUES ('934', '440705', '新会区', '3', '440700', null, '1');
INSERT INTO AREA_INFO VALUES ('935', '440781', '台山市', '3', '440700', null, '1');
INSERT INTO AREA_INFO VALUES ('936', '440783', '开平市', '3', '440700', null, '1');
INSERT INTO AREA_INFO VALUES ('937', '440784', '鹤山市', '3', '440700', null, '1');
INSERT INTO AREA_INFO VALUES ('938', '440785', '恩平市', '3', '440700', null, '1');
INSERT INTO AREA_INFO VALUES ('939', '440800', '湛江市', '2', '440000', null, '1');
INSERT INTO AREA_INFO VALUES ('940', '440801', '市辖区', '3', '440800', null, '1');
INSERT INTO AREA_INFO VALUES ('941', '440802', '赤坎区', '3', '440800', null, '1');
INSERT INTO AREA_INFO VALUES ('942', '440803', '霞山区', '3', '440800', null, '1');
INSERT INTO AREA_INFO VALUES ('943', '440804', '坡头区', '3', '440800', null, '1');
INSERT INTO AREA_INFO VALUES ('944', '440811', '麻章区', '3', '440800', null, '1');
INSERT INTO AREA_INFO VALUES ('945', '440823', '遂溪县', '3', '440800', null, '1');
INSERT INTO AREA_INFO VALUES ('946', '440825', '徐闻县', '3', '440800', null, '1');
INSERT INTO AREA_INFO VALUES ('947', '440881', '廉江市', '3', '440800', null, '1');
INSERT INTO AREA_INFO VALUES ('948', '440882', '雷州市', '3', '440800', null, '1');
INSERT INTO AREA_INFO VALUES ('949', '440883', '吴川市', '3', '440800', null, '1');
INSERT INTO AREA_INFO VALUES ('950', '440900', '茂名市', '2', '440000', null, '1');
INSERT INTO AREA_INFO VALUES ('951', '440901', '市辖区', '3', '440900', null, '1');
INSERT INTO AREA_INFO VALUES ('952', '440902', '茂南区', '3', '440900', null, '1');
INSERT INTO AREA_INFO VALUES ('953', '440903', '茂港区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('954', '440923', '电白县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('955', '440981', '高州市', '3', '440900', null, '1');
INSERT INTO AREA_INFO VALUES ('956', '440982', '化州市', '3', '440900', null, '1');
INSERT INTO AREA_INFO VALUES ('957', '440983', '信宜市', '3', '440900', null, '1');
INSERT INTO AREA_INFO VALUES ('958', '441200', '肇庆市', '2', '440000', null, '1');
INSERT INTO AREA_INFO VALUES ('959', '441201', '市辖区', '3', '441200', null, '1');
INSERT INTO AREA_INFO VALUES ('960', '441202', '端州区', '3', '441200', null, '1');
INSERT INTO AREA_INFO VALUES ('961', '441203', '鼎湖区', '3', '441200', null, '1');
INSERT INTO AREA_INFO VALUES ('962', '441223', '广宁县', '3', '441200', null, '1');
INSERT INTO AREA_INFO VALUES ('963', '441224', '怀集县', '3', '441200', null, '1');
INSERT INTO AREA_INFO VALUES ('964', '441225', '封开县', '3', '441200', null, '1');
INSERT INTO AREA_INFO VALUES ('965', '441226', '德庆县', '3', '441200', null, '1');
INSERT INTO AREA_INFO VALUES ('966', '441283', '高要市', '3', '441200', null, '1');
INSERT INTO AREA_INFO VALUES ('967', '441284', '四会市', '3', '441200', null, '1');
INSERT INTO AREA_INFO VALUES ('968', '441300', '惠州市', '2', '440000', null, '1');
INSERT INTO AREA_INFO VALUES ('969', '441301', '市辖区', '3', '441300', null, '1');
INSERT INTO AREA_INFO VALUES ('970', '441302', '惠城区', '3', '441300', null, '1');
INSERT INTO AREA_INFO VALUES ('971', '441303', '惠阳区', '3', '441300', null, '1');
INSERT INTO AREA_INFO VALUES ('972', '441322', '博罗县', '3', '441300', null, '1');
INSERT INTO AREA_INFO VALUES ('973', '441323', '惠东县', '3', '441300', null, '1');
INSERT INTO AREA_INFO VALUES ('974', '441324', '龙门县', '3', '441300', null, '1');
INSERT INTO AREA_INFO VALUES ('975', '441400', '梅州市', '2', '440000', null, '1');
INSERT INTO AREA_INFO VALUES ('976', '441401', '市辖区', '3', '441400', null, '1');
INSERT INTO AREA_INFO VALUES ('977', '441402', '梅江区', '3', '441400', null, '1');
INSERT INTO AREA_INFO VALUES ('978', '410803', '中站区', '3', '410800', null, '1');
INSERT INTO AREA_INFO VALUES ('979', '410804', '马村区', '3', '410800', null, '1');
INSERT INTO AREA_INFO VALUES ('980', '410811', '山阳区', '3', '410800', null, '1');
INSERT INTO AREA_INFO VALUES ('981', '410821', '修武县', '3', '410800', null, '1');
INSERT INTO AREA_INFO VALUES ('982', '410822', '博爱县', '3', '410800', null, '1');
INSERT INTO AREA_INFO VALUES ('983', '410823', '武陟县', '3', '410800', null, '1');
INSERT INTO AREA_INFO VALUES ('984', '410825', '温县', '3', '410800', null, '1');
INSERT INTO AREA_INFO VALUES ('985', '410881', '济源市', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('986', '410883', '孟州市', '3', '410800', null, '1');
INSERT INTO AREA_INFO VALUES ('987', '410900', '濮阳市', '2', '410000', null, '1');
INSERT INTO AREA_INFO VALUES ('988', '410901', '市辖区', '3', '410900', null, '1');
INSERT INTO AREA_INFO VALUES ('989', '410922', '清丰县', '3', '410900', null, '1');
INSERT INTO AREA_INFO VALUES ('990', '410923', '南乐县', '3', '410900', null, '1');
INSERT INTO AREA_INFO VALUES ('991', '410926', '范县', '3', '410900', null, '1');
INSERT INTO AREA_INFO VALUES ('992', '410927', '台前县', '3', '410900', null, '1');
INSERT INTO AREA_INFO VALUES ('993', '410928', '濮阳县', '3', '410900', null, '1');
INSERT INTO AREA_INFO VALUES ('994', '411000', '许昌市', '2', '410000', null, '1');
INSERT INTO AREA_INFO VALUES ('995', '411002', '魏都区', '3', '411000', null, '1');
INSERT INTO AREA_INFO VALUES ('996', '411023', '许昌县', '3', '411000', null, '1');
INSERT INTO AREA_INFO VALUES ('997', '411323', '西峡县', '3', '411300', null, '1');
INSERT INTO AREA_INFO VALUES ('998', '411324', '镇平县', '3', '411300', null, '1');
INSERT INTO AREA_INFO VALUES ('999', '411325', '内乡县', '3', '411300', null, '1');
INSERT INTO AREA_INFO VALUES ('1000', '411326', '淅川县', '3', '411300', null, '1');
INSERT INTO AREA_INFO VALUES ('1001', '411327', '社旗县', '3', '411300', null, '1');
INSERT INTO AREA_INFO VALUES ('1002', '411328', '唐河县', '3', '411300', null, '1');
COMMIT;INSERT INTO AREA_INFO VALUES ('1003', '411329', '新野县', '3', '411300', null, '1');
INSERT INTO AREA_INFO VALUES ('1004', '411330', '桐柏县', '3', '411300', null, '1');
INSERT INTO AREA_INFO VALUES ('1005', '411381', '邓州市', '3', '411300', null, '1');
INSERT INTO AREA_INFO VALUES ('1006', '411400', '商丘市', '2', '410000', null, '1');
INSERT INTO AREA_INFO VALUES ('1007', '411401', '市辖区', '3', '411400', null, '1');
INSERT INTO AREA_INFO VALUES ('1008', '411402', '梁园区', '3', '411400', null, '1');
INSERT INTO AREA_INFO VALUES ('1009', '411403', '睢阳区', '3', '411400', null, '1');
INSERT INTO AREA_INFO VALUES ('1010', '411421', '民权县', '3', '411400', null, '1');
INSERT INTO AREA_INFO VALUES ('1011', '411422', '睢县', '3', '411400', null, '1');
INSERT INTO AREA_INFO VALUES ('1012', '411423', '宁陵县', '3', '411400', null, '1');
INSERT INTO AREA_INFO VALUES ('1013', '441501', '市辖区', '3', '441500', null, '1');
INSERT INTO AREA_INFO VALUES ('1014', '441502', '城区', '3', '441500', null, '1');
INSERT INTO AREA_INFO VALUES ('1015', '441521', '海丰县', '3', '441500', null, '1');
INSERT INTO AREA_INFO VALUES ('1016', '441523', '陆河县', '3', '441500', null, '1');
INSERT INTO AREA_INFO VALUES ('1017', '441581', '陆丰市', '3', '441500', null, '1');
INSERT INTO AREA_INFO VALUES ('1018', '441600', '河源市', '2', '440000', null, '1');
INSERT INTO AREA_INFO VALUES ('1019', '441601', '市辖区', '3', '441600', null, '1');
INSERT INTO AREA_INFO VALUES ('1020', '441602', '源城区', '3', '441600', null, '1');
INSERT INTO AREA_INFO VALUES ('1021', '441621', '紫金县', '3', '441600', null, '1');
INSERT INTO AREA_INFO VALUES ('1022', '441622', '龙川县', '3', '441600', null, '1');
INSERT INTO AREA_INFO VALUES ('1023', '441624', '和平县', '3', '441600', null, '1');
INSERT INTO AREA_INFO VALUES ('1024', '441625', '东源县', '3', '441600', null, '1');
INSERT INTO AREA_INFO VALUES ('1025', '441700', '阳江市', '2', '440000', null, '1');
INSERT INTO AREA_INFO VALUES ('1026', '441701', '市辖区', '3', '441700', null, '1');
INSERT INTO AREA_INFO VALUES ('1027', '441702', '江城区', '3', '441700', null, '1');
INSERT INTO AREA_INFO VALUES ('1028', '441721', '阳西县', '3', '441700', null, '1');
INSERT INTO AREA_INFO VALUES ('1029', '441723', '阳东县', '3', '441700', null, '1');
INSERT INTO AREA_INFO VALUES ('2364', '350628', '平和县', '3', '350600', null, '1');
INSERT INTO AREA_INFO VALUES ('2365', '350629', '华安县', '3', '350600', null, '1');
INSERT INTO AREA_INFO VALUES ('2366', '350681', '龙海市', '3', '350600', null, '1');
INSERT INTO AREA_INFO VALUES ('2367', '350702', '延平区', '3', '350700', null, '1');
INSERT INTO AREA_INFO VALUES ('2368', '350721', '顺昌县', '3', '350700', null, '1');
INSERT INTO AREA_INFO VALUES ('2369', '350722', '浦城县', '3', '350700', null, '1');
INSERT INTO AREA_INFO VALUES ('2370', '350723', '光泽县', '3', '350700', null, '1');
INSERT INTO AREA_INFO VALUES ('2371', '350724', '松溪县', '3', '350700', null, '1');
INSERT INTO AREA_INFO VALUES ('2372', '350725', '政和县', '3', '350700', null, '1');
INSERT INTO AREA_INFO VALUES ('2373', '350781', '邵武市', '3', '350700', null, '1');
INSERT INTO AREA_INFO VALUES ('2374', '350782', '武夷山市', '3', '350700', null, '1');
INSERT INTO AREA_INFO VALUES ('2375', '350783', '建瓯市', '3', '350700', null, '1');
INSERT INTO AREA_INFO VALUES ('2376', '350784', '建阳市', '3', '350700', null, '1');
INSERT INTO AREA_INFO VALUES ('2377', '350800', '龙岩市', '2', '350000', null, '1');
INSERT INTO AREA_INFO VALUES ('2378', '350801', '市辖区', '3', '350800', null, '1');
INSERT INTO AREA_INFO VALUES ('2379', '350802', '新罗区', '3', '350800', null, '1');
INSERT INTO AREA_INFO VALUES ('2380', '350821', '长汀县', '3', '350800', null, '1');
INSERT INTO AREA_INFO VALUES ('2381', '350822', '永定县', '3', '350800', null, '1');
INSERT INTO AREA_INFO VALUES ('2382', '350823', '上杭县', '3', '350800', null, '1');
INSERT INTO AREA_INFO VALUES ('2383', '350824', '武平县', '3', '350800', null, '1');
INSERT INTO AREA_INFO VALUES ('2384', '350825', '连城县', '3', '350800', null, '1');
INSERT INTO AREA_INFO VALUES ('2385', '350881', '漳平市', '3', '350800', null, '1');
INSERT INTO AREA_INFO VALUES ('2386', '350900', '宁德市', '2', '350000', null, '1');
INSERT INTO AREA_INFO VALUES ('2387', '350901', '市辖区', '3', '350900', null, '1');
INSERT INTO AREA_INFO VALUES ('2388', '350902', '蕉城区', '3', '350900', null, '1');
INSERT INTO AREA_INFO VALUES ('2389', '350921', '霞浦县', '3', '350900', null, '1');
INSERT INTO AREA_INFO VALUES ('2390', '350922', '古田县', '3', '350900', null, '1');
INSERT INTO AREA_INFO VALUES ('2391', '350923', '屏南县', '3', '350900', null, '1');
INSERT INTO AREA_INFO VALUES ('2392', '350924', '寿宁县', '3', '350900', null, '1');
INSERT INTO AREA_INFO VALUES ('2393', '350925', '周宁县', '3', '350900', null, '1');
INSERT INTO AREA_INFO VALUES ('2394', '350926', '柘荣县', '3', '350900', null, '1');
INSERT INTO AREA_INFO VALUES ('2395', '350981', '福安市', '3', '350900', null, '1');
INSERT INTO AREA_INFO VALUES ('2396', '350982', '福鼎市', '3', '350900', null, '1');
INSERT INTO AREA_INFO VALUES ('2397', '360000', '江西省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('2398', '360100', '南昌市', '2', '360000', null, '1');
INSERT INTO AREA_INFO VALUES ('2399', '360200', '景德镇市', '2', '360000', null, '1');
INSERT INTO AREA_INFO VALUES ('2400', '360201', '市辖区', '3', '360200', null, '1');
INSERT INTO AREA_INFO VALUES ('2401', '360202', '昌江区', '3', '360200', null, '1');
INSERT INTO AREA_INFO VALUES ('2402', '360203', '珠山区', '3', '360200', null, '1');
INSERT INTO AREA_INFO VALUES ('2403', '360222', '浮梁县', '3', '360200', null, '1');
INSERT INTO AREA_INFO VALUES ('2404', '360281', '乐平市', '3', '360200', null, '1');
INSERT INTO AREA_INFO VALUES ('2405', '360300', '萍乡市', '2', '360000', null, '1');
INSERT INTO AREA_INFO VALUES ('2406', '360301', '市辖区', '3', '360300', null, '1');
INSERT INTO AREA_INFO VALUES ('2407', '360602', '月湖区', '3', '360600', null, '1');
INSERT INTO AREA_INFO VALUES ('2408', '360622', '余江县', '3', '360600', null, '1');
INSERT INTO AREA_INFO VALUES ('2409', '360681', '贵溪市', '3', '360600', null, '1');
INSERT INTO AREA_INFO VALUES ('2410', '360700', '赣州市', '2', '360000', null, '1');
INSERT INTO AREA_INFO VALUES ('2411', '360701', '市辖区', '3', '360700', null, '1');
INSERT INTO AREA_INFO VALUES ('2412', '360702', '章贡区', '3', '360700', null, '1');
INSERT INTO AREA_INFO VALUES ('2413', '360721', '赣县', '3', '360700', null, '1');
INSERT INTO AREA_INFO VALUES ('2414', '360723', '大余县', '3', '360700', null, '1');
INSERT INTO AREA_INFO VALUES ('2415', '360724', '上犹县', '3', '360700', null, '1');
INSERT INTO AREA_INFO VALUES ('2416', '360725', '崇义县', '3', '360700', null, '1');
INSERT INTO AREA_INFO VALUES ('2417', '360726', '安远县', '3', '360700', null, '1');
INSERT INTO AREA_INFO VALUES ('2418', '360727', '龙南县', '3', '360700', null, '1');
INSERT INTO AREA_INFO VALUES ('2419', '360728', '定南县', '3', '360700', null, '1');
INSERT INTO AREA_INFO VALUES ('2420', '360729', '全南县', '3', '360700', null, '1');
INSERT INTO AREA_INFO VALUES ('2421', '360730', '宁都县', '3', '360700', null, '1');
INSERT INTO AREA_INFO VALUES ('2422', '360731', '于都县', '3', '360700', null, '1');
INSERT INTO AREA_INFO VALUES ('2423', '360732', '兴国县', '3', '360700', null, '1');
INSERT INTO AREA_INFO VALUES ('2424', '360733', '会昌县', '3', '360700', null, '1');
INSERT INTO AREA_INFO VALUES ('2425', '360734', '寻乌县', '3', '360700', null, '1');
INSERT INTO AREA_INFO VALUES ('2426', '360735', '石城县', '3', '360700', null, '1');
INSERT INTO AREA_INFO VALUES ('2427', '360781', '瑞金市', '3', '360700', null, '1');
INSERT INTO AREA_INFO VALUES ('2428', '360782', '南康市', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2429', '360800', '吉安市', '2', '360000', null, '1');
INSERT INTO AREA_INFO VALUES ('2430', '360801', '市辖区', '3', '360800', null, '1');
INSERT INTO AREA_INFO VALUES ('2431', '360802', '吉州区', '3', '360800', null, '1');
INSERT INTO AREA_INFO VALUES ('2432', '360803', '青原区', '3', '360800', null, '1');
INSERT INTO AREA_INFO VALUES ('2433', '360821', '吉安县', '3', '360800', null, '1');
INSERT INTO AREA_INFO VALUES ('2434', '360822', '吉水县', '3', '360800', null, '1');
INSERT INTO AREA_INFO VALUES ('2435', '360823', '峡江县', '3', '360800', null, '1');
INSERT INTO AREA_INFO VALUES ('2436', '360824', '新干县', '3', '360800', null, '1');
INSERT INTO AREA_INFO VALUES ('2437', '360825', '永丰县', '3', '360800', null, '1');
INSERT INTO AREA_INFO VALUES ('2438', '360826', '泰和县', '3', '360800', null, '1');
INSERT INTO AREA_INFO VALUES ('2439', '360827', '遂川县', '3', '360800', null, '1');
INSERT INTO AREA_INFO VALUES ('2440', '360830', '永新县', '3', '360800', null, '1');
INSERT INTO AREA_INFO VALUES ('2441', '360881', '井冈山市', '3', '360800', null, '1');
INSERT INTO AREA_INFO VALUES ('2442', '131102', '桃城区', '3', '131100', null, '1');
INSERT INTO AREA_INFO VALUES ('2443', '210321', '台安县', '3', '210300', null, '1');
INSERT INTO AREA_INFO VALUES ('2444', '210323', '岫岩满族自治县', '3', '210300', null, '1');
INSERT INTO AREA_INFO VALUES ('2445', '210381', '海城市', '3', '210300', null, '1');
INSERT INTO AREA_INFO VALUES ('2446', '210400', '抚顺市', '2', '210000', null, '1');
INSERT INTO AREA_INFO VALUES ('2447', '210401', '市辖区', '3', '210400', null, '1');
INSERT INTO AREA_INFO VALUES ('2448', '210402', '新抚区', '3', '210400', null, '1');
INSERT INTO AREA_INFO VALUES ('2449', '210403', '东洲区', '3', '210400', null, '1');
INSERT INTO AREA_INFO VALUES ('2450', '210404', '望花区', '3', '210400', null, '1');
INSERT INTO AREA_INFO VALUES ('2451', '210411', '顺城区', '3', '210400', null, '1');
INSERT INTO AREA_INFO VALUES ('2452', '210421', '抚顺县', '3', '210400', null, '1');
INSERT INTO AREA_INFO VALUES ('2453', '210422', '新宾满族自治县', '3', '210400', null, '1');
INSERT INTO AREA_INFO VALUES ('2454', '210423', '清原满族自治县', '3', '210400', null, '1');
INSERT INTO AREA_INFO VALUES ('2455', '210500', '本溪市', '2', '210000', null, '1');
INSERT INTO AREA_INFO VALUES ('2456', '210501', '市辖区', '3', '210500', null, '1');
INSERT INTO AREA_INFO VALUES ('2457', '210502', '平山区', '3', '210500', null, '1');
INSERT INTO AREA_INFO VALUES ('2458', '210503', '溪湖区', '3', '210500', null, '1');
INSERT INTO AREA_INFO VALUES ('2459', '210504', '明山区', '3', '210500', null, '1');
INSERT INTO AREA_INFO VALUES ('2460', '210505', '南芬区', '3', '210500', null, '1');
INSERT INTO AREA_INFO VALUES ('2461', '210521', '本溪满族自治县', '3', '210500', null, '1');
INSERT INTO AREA_INFO VALUES ('2462', '210522', '桓仁满族自治县', '3', '210500', null, '1');
INSERT INTO AREA_INFO VALUES ('2463', '210600', '丹东市', '2', '210000', null, '1');
INSERT INTO AREA_INFO VALUES ('2464', '210601', '市辖区', '3', '210600', null, '1');
INSERT INTO AREA_INFO VALUES ('2465', '210602', '元宝区', '3', '210600', null, '1');
INSERT INTO AREA_INFO VALUES ('2466', '210603', '振兴区', '3', '210600', null, '1');
INSERT INTO AREA_INFO VALUES ('2467', '210604', '振安区', '3', '210600', null, '1');
INSERT INTO AREA_INFO VALUES ('2468', '210624', '宽甸满族自治县', '3', '210600', null, '1');
INSERT INTO AREA_INFO VALUES ('2469', '210681', '东港市', '3', '210600', null, '1');
INSERT INTO AREA_INFO VALUES ('2470', '210682', '凤城市', '3', '210600', null, '1');
INSERT INTO AREA_INFO VALUES ('2471', '210700', '锦州市', '2', '210000', null, '1');
INSERT INTO AREA_INFO VALUES ('2472', '210701', '市辖区', '3', '210700', null, '1');
INSERT INTO AREA_INFO VALUES ('2473', '210702', '古塔区', '3', '210700', null, '1');
INSERT INTO AREA_INFO VALUES ('2474', '532527', '泸西县', '3', '532500', null, '1');
INSERT INTO AREA_INFO VALUES ('2475', '532528', '元阳县', '3', '532500', null, '1');
INSERT INTO AREA_INFO VALUES ('2476', '532529', '红河县', '3', '532500', null, '1');
INSERT INTO AREA_INFO VALUES ('2477', '532532', '河口瑶族自治县', '3', '532500', null, '1');
INSERT INTO AREA_INFO VALUES ('2478', '532623', '西畴县', '3', '532600', null, '1');
INSERT INTO AREA_INFO VALUES ('2479', '532624', '麻栗坡县', '3', '532600', null, '1');
INSERT INTO AREA_INFO VALUES ('2480', '532625', '马关县', '3', '532600', null, '1');
INSERT INTO AREA_INFO VALUES ('2481', '532626', '丘北县', '3', '532600', null, '1');
INSERT INTO AREA_INFO VALUES ('2482', '532627', '广南县', '3', '532600', null, '1');
INSERT INTO AREA_INFO VALUES ('2483', '532628', '富宁县', '3', '532600', null, '1');
INSERT INTO AREA_INFO VALUES ('2484', '532800', '西双版纳傣族自治州', '2', '530000', null, '1');
INSERT INTO AREA_INFO VALUES ('2485', '532801', '景洪市', '3', '532800', null, '1');
INSERT INTO AREA_INFO VALUES ('2486', '532822', '勐海县', '3', '532800', null, '1');
INSERT INTO AREA_INFO VALUES ('2487', '532823', '勐腊县', '3', '532800', null, '1');
INSERT INTO AREA_INFO VALUES ('2488', '532900', '大理白族自治州', '2', '530000', null, '1');
INSERT INTO AREA_INFO VALUES ('2489', '532901', '大理市', '3', '532900', null, '1');
INSERT INTO AREA_INFO VALUES ('2490', '532922', '漾濞彝族自治县', '3', '532900', null, '1');
INSERT INTO AREA_INFO VALUES ('2491', '532923', '祥云县', '3', '532900', null, '1');
INSERT INTO AREA_INFO VALUES ('2492', '532924', '宾川县', '3', '532900', null, '1');
INSERT INTO AREA_INFO VALUES ('2493', '532925', '弥渡县', '3', '532900', null, '1');
INSERT INTO AREA_INFO VALUES ('2494', '532926', '南涧彝族自治县', '3', '532900', null, '1');
INSERT INTO AREA_INFO VALUES ('2495', '532927', '巍山彝族回族自治县', '3', '532900', null, '1');
INSERT INTO AREA_INFO VALUES ('2496', '532928', '永平县', '3', '532900', null, '1');
INSERT INTO AREA_INFO VALUES ('2497', '532929', '云龙县', '3', '532900', null, '1');
INSERT INTO AREA_INFO VALUES ('2498', '532930', '洱源县', '3', '532900', null, '1');
INSERT INTO AREA_INFO VALUES ('2499', '451029', '田林县', '3', '451000', null, '1');
INSERT INTO AREA_INFO VALUES ('2500', '451030', '西林县', '3', '451000', null, '1');
INSERT INTO AREA_INFO VALUES ('2501', '451031', '隆林各族自治县', '3', '451000', null, '1');
INSERT INTO AREA_INFO VALUES ('2502', '451100', '贺州市', '2', '450000', null, '1');
INSERT INTO AREA_INFO VALUES ('2503', '451101', '市辖区', '3', '451100', null, '1');
INSERT INTO AREA_INFO VALUES ('2504', '451102', '八步区', '3', '451100', null, '1');
INSERT INTO AREA_INFO VALUES ('2505', '451121', '昭平县', '3', '451100', null, '1');
INSERT INTO AREA_INFO VALUES ('2506', '451122', '钟山县', '3', '451100', null, '1');
INSERT INTO AREA_INFO VALUES ('2507', '451123', '富川瑶族自治县', '3', '451100', null, '1');
INSERT INTO AREA_INFO VALUES ('2508', '451200', '河池市', '2', '450000', null, '1');
INSERT INTO AREA_INFO VALUES ('2509', '451201', '市辖区', '3', '451200', null, '1');
INSERT INTO AREA_INFO VALUES ('2510', '451221', '南丹县', '3', '451200', null, '1');
INSERT INTO AREA_INFO VALUES ('2511', '451222', '天峨县', '3', '451200', null, '1');
INSERT INTO AREA_INFO VALUES ('2512', '451223', '凤山县', '3', '451200', null, '1');
INSERT INTO AREA_INFO VALUES ('2513', '451224', '东兰县', '3', '451200', null, '1');
INSERT INTO AREA_INFO VALUES ('2514', '451225', '罗城仫佬族自治县', '3', '451200', null, '1');
INSERT INTO AREA_INFO VALUES ('2515', '532931', '剑川县', '3', '532900', null, '1');
INSERT INTO AREA_INFO VALUES ('2516', '532932', '鹤庆县', '3', '532900', null, '1');
INSERT INTO AREA_INFO VALUES ('2517', '533100', '德宏傣族景颇族自治州', '2', '530000', null, '1');
INSERT INTO AREA_INFO VALUES ('2518', '540101', '市辖区', '3', '540100', null, '1');
INSERT INTO AREA_INFO VALUES ('2519', '210201', '市辖区', '3', '210200', null, '1');
INSERT INTO AREA_INFO VALUES ('2520', '210202', '中山区', '3', '210200', null, '1');
INSERT INTO AREA_INFO VALUES ('2521', '210203', '西岗区', '3', '210200', null, '1');
INSERT INTO AREA_INFO VALUES ('2522', '210204', '沙河口区', '3', '210200', null, '1');
INSERT INTO AREA_INFO VALUES ('2523', '210211', '甘井子区', '3', '210200', null, '1');
INSERT INTO AREA_INFO VALUES ('2524', '210212', '旅顺口区', '3', '210200', null, '1');
INSERT INTO AREA_INFO VALUES ('2525', '210213', '金州区', '3', '210200', null, '1');
INSERT INTO AREA_INFO VALUES ('2526', '210224', '长海县', '3', '210200', null, '1');
INSERT INTO AREA_INFO VALUES ('2527', '210281', '瓦房店市', '3', '210200', null, '1');
INSERT INTO AREA_INFO VALUES ('2528', '210282', '普兰店市', '3', '210200', null, '1');
INSERT INTO AREA_INFO VALUES ('2529', '210283', '庄河市', '3', '210200', null, '1');
INSERT INTO AREA_INFO VALUES ('2530', '210300', '鞍山市', '2', '210000', null, '1');
INSERT INTO AREA_INFO VALUES ('2531', '210301', '市辖区', '3', '210300', null, '1');
INSERT INTO AREA_INFO VALUES ('2532', '210302', '铁东区', '3', '210300', null, '1');
INSERT INTO AREA_INFO VALUES ('2533', '210303', '铁西区', '3', '210300', null, '1');
INSERT INTO AREA_INFO VALUES ('2534', '210304', '立山区', '3', '210300', null, '1');
INSERT INTO AREA_INFO VALUES ('2535', '210311', '千山区', '3', '210300', null, '1');
INSERT INTO AREA_INFO VALUES ('2536', '360900', '宜春市', '2', '360000', null, '1');
INSERT INTO AREA_INFO VALUES ('2537', '360901', '市辖区', '3', '360900', null, '1');
INSERT INTO AREA_INFO VALUES ('2538', '360902', '袁州区', '3', '360900', null, '1');
INSERT INTO AREA_INFO VALUES ('2539', '360921', '奉新县', '3', '360900', null, '1');
INSERT INTO AREA_INFO VALUES ('2540', '360922', '万载县', '3', '360900', null, '1');
INSERT INTO AREA_INFO VALUES ('2541', '360923', '上高县', '3', '360900', null, '1');
INSERT INTO AREA_INFO VALUES ('2542', '360924', '宜丰县', '3', '360900', null, '1');
INSERT INTO AREA_INFO VALUES ('2543', '360925', '靖安县', '3', '360900', null, '1');
INSERT INTO AREA_INFO VALUES ('2544', '360926', '铜鼓县', '3', '360900', null, '1');
INSERT INTO AREA_INFO VALUES ('2545', '360981', '丰城市', '3', '360900', null, '1');
INSERT INTO AREA_INFO VALUES ('2546', '360982', '樟树市', '3', '360900', null, '1');
INSERT INTO AREA_INFO VALUES ('2547', '360983', '高安市', '3', '360900', null, '1');
INSERT INTO AREA_INFO VALUES ('2548', '361000', '抚州市', '2', '360000', null, '1');
INSERT INTO AREA_INFO VALUES ('2549', '361001', '市辖区', '3', '361000', null, '1');
INSERT INTO AREA_INFO VALUES ('2550', '361002', '临川区', '3', '361000', null, '1');
INSERT INTO AREA_INFO VALUES ('2551', '361021', '南城县', '3', '361000', null, '1');
INSERT INTO AREA_INFO VALUES ('2552', '361022', '黎川县', '3', '361000', null, '1');
INSERT INTO AREA_INFO VALUES ('2553', '361023', '南丰县', '3', '361000', null, '1');
INSERT INTO AREA_INFO VALUES ('2554', '361024', '崇仁县', '3', '361000', null, '1');
INSERT INTO AREA_INFO VALUES ('2555', '361025', '乐安县', '3', '361000', null, '1');
INSERT INTO AREA_INFO VALUES ('2556', '361026', '宜黄县', '3', '361000', null, '1');
INSERT INTO AREA_INFO VALUES ('2557', '361027', '金溪县', '3', '361000', null, '1');
INSERT INTO AREA_INFO VALUES ('2558', '361028', '资溪县', '3', '361000', null, '1');
INSERT INTO AREA_INFO VALUES ('2559', '361029', '东乡县', '3', '361000', null, '1');
INSERT INTO AREA_INFO VALUES ('2560', '361030', '广昌县', '3', '361000', null, '1');
INSERT INTO AREA_INFO VALUES ('2561', '361100', '上饶市', '2', '360000', null, '1');
INSERT INTO AREA_INFO VALUES ('2562', '361101', '市辖区', '3', '361100', null, '1');
INSERT INTO AREA_INFO VALUES ('2563', '361102', '信州区', '3', '361100', null, '1');
INSERT INTO AREA_INFO VALUES ('2564', '361121', '上饶县', '3', '361100', null, '1');
INSERT INTO AREA_INFO VALUES ('2565', '361122', '广丰县', '3', '361100', null, '1');
INSERT INTO AREA_INFO VALUES ('2566', '361123', '玉山县', '3', '361100', null, '1');
INSERT INTO AREA_INFO VALUES ('2567', '361124', '铅山县', '3', '361100', null, '1');
INSERT INTO AREA_INFO VALUES ('2568', '361125', '横峰县', '3', '361100', null, '1');
INSERT INTO AREA_INFO VALUES ('2569', '361126', '弋阳县', '3', '361100', null, '1');
INSERT INTO AREA_INFO VALUES ('2570', '361127', '余干县', '3', '361100', null, '1');
INSERT INTO AREA_INFO VALUES ('2571', '361128', '鄱阳县', '3', '361100', null, '1');
INSERT INTO AREA_INFO VALUES ('2572', '361129', '万年县', '3', '361100', null, '1');
INSERT INTO AREA_INFO VALUES ('2573', '361130', '婺源县', '3', '361100', null, '1');
INSERT INTO AREA_INFO VALUES ('2574', '361181', '德兴市', '3', '361100', null, '1');
INSERT INTO AREA_INFO VALUES ('2575', '370000', '山东省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('2576', '370100', '济南市', '2', '370000', null, '1');
INSERT INTO AREA_INFO VALUES ('2577', '370101', '市辖区', '3', '370100', null, '1');
INSERT INTO AREA_INFO VALUES ('2578', '370102', '历下区', '3', '370100', null, '1');
INSERT INTO AREA_INFO VALUES ('2579', '370103', '市中区', '3', '370100', null, '1');
INSERT INTO AREA_INFO VALUES ('2580', '370104', '槐荫区', '3', '370100', null, '1');
INSERT INTO AREA_INFO VALUES ('2581', '370105', '天桥区', '3', '370100', null, '1');
INSERT INTO AREA_INFO VALUES ('2582', '370112', '历城区', '3', '370100', null, '1');
INSERT INTO AREA_INFO VALUES ('2583', '370113', '长清区', '3', '370100', null, '1');
INSERT INTO AREA_INFO VALUES ('2584', '370124', '平阴县', '3', '370100', null, '1');
INSERT INTO AREA_INFO VALUES ('2585', '370125', '济阳县', '3', '370100', null, '1');
INSERT INTO AREA_INFO VALUES ('2586', '370126', '商河县', '3', '370100', null, '1');
INSERT INTO AREA_INFO VALUES ('2587', '370181', '章丘市', '3', '370100', null, '1');
INSERT INTO AREA_INFO VALUES ('2588', '370200', '青岛市', '2', '370000', null, '1');
INSERT INTO AREA_INFO VALUES ('2589', '370201', '市辖区', '3', '370200', null, '1');
INSERT INTO AREA_INFO VALUES ('2590', '370284', '胶南市', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2591', '370285', '莱西市', '3', '370200', null, '1');
INSERT INTO AREA_INFO VALUES ('2592', '370300', '淄博市', '2', '370000', null, '1');
INSERT INTO AREA_INFO VALUES ('2593', '370301', '市辖区', '3', '370300', null, '1');
INSERT INTO AREA_INFO VALUES ('2594', '370302', '淄川区', '3', '370300', null, '1');
INSERT INTO AREA_INFO VALUES ('2595', '370303', '张店区', '3', '370300', null, '1');
INSERT INTO AREA_INFO VALUES ('2596', '370304', '博山区', '3', '370300', null, '1');
INSERT INTO AREA_INFO VALUES ('2597', '370305', '临淄区', '3', '370300', null, '1');
INSERT INTO AREA_INFO VALUES ('2598', '370306', '周村区', '3', '370300', null, '1');
INSERT INTO AREA_INFO VALUES ('2599', '370321', '桓台县', '3', '370300', null, '1');
INSERT INTO AREA_INFO VALUES ('2600', '370600', '烟台市', '2', '370000', null, '1');
INSERT INTO AREA_INFO VALUES ('2601', '370601', '市辖区', '3', '370600', null, '1');
INSERT INTO AREA_INFO VALUES ('2602', '370602', '芝罘区', '3', '370600', null, '1');
INSERT INTO AREA_INFO VALUES ('2603', '370611', '福山区', '3', '370600', null, '1');
INSERT INTO AREA_INFO VALUES ('2604', '370612', '牟平区', '3', '370600', null, '1');
INSERT INTO AREA_INFO VALUES ('2605', '370613', '莱山区', '3', '370600', null, '1');
INSERT INTO AREA_INFO VALUES ('2606', '370634', '长岛县', '3', '370600', null, '1');
INSERT INTO AREA_INFO VALUES ('2607', '370681', '龙口市', '3', '370600', null, '1');
INSERT INTO AREA_INFO VALUES ('2608', '370682', '莱阳市', '3', '370600', null, '1');
INSERT INTO AREA_INFO VALUES ('2609', '370683', '莱州市', '3', '370600', null, '1');
INSERT INTO AREA_INFO VALUES ('2610', '370684', '蓬莱市', '3', '370600', null, '1');
INSERT INTO AREA_INFO VALUES ('2611', '370685', '招远市', '3', '370600', null, '1');
INSERT INTO AREA_INFO VALUES ('2612', '370686', '栖霞市', '3', '370600', null, '1');
INSERT INTO AREA_INFO VALUES ('2613', '370786', '昌邑市', '3', '370700', null, '1');
INSERT INTO AREA_INFO VALUES ('2614', '370800', '济宁市', '2', '370000', null, '1');
INSERT INTO AREA_INFO VALUES ('2615', '370801', '市辖区', '3', '370800', null, '1');
INSERT INTO AREA_INFO VALUES ('2616', '370802', '市中区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2617', '370811', '任城区', '3', '370800', null, '1');
INSERT INTO AREA_INFO VALUES ('2618', '370826', '微山县', '3', '370800', null, '1');
INSERT INTO AREA_INFO VALUES ('2619', '370827', '鱼台县', '3', '370800', null, '1');
INSERT INTO AREA_INFO VALUES ('2620', '370828', '金乡县', '3', '370800', null, '1');
INSERT INTO AREA_INFO VALUES ('2621', '370883', '邹城市', '3', '370800', null, '1');
INSERT INTO AREA_INFO VALUES ('2622', '370900', '泰安市', '2', '370000', null, '1');
INSERT INTO AREA_INFO VALUES ('2623', '370901', '市辖区', '3', '370900', null, '1');
INSERT INTO AREA_INFO VALUES ('2624', '370902', '泰山区', '3', '370900', null, '1');
INSERT INTO AREA_INFO VALUES ('2625', '370903', '岱岳区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2626', '370921', '宁阳县', '3', '370900', null, '1');
INSERT INTO AREA_INFO VALUES ('2627', '370923', '东平县', '3', '370900', null, '1');
INSERT INTO AREA_INFO VALUES ('2628', '370982', '新泰市', '3', '370900', null, '1');
INSERT INTO AREA_INFO VALUES ('2629', '140428', '长子县', '3', '140400', null, '1');
INSERT INTO AREA_INFO VALUES ('2630', '210101', '市辖区', '3', '210100', null, '1');
INSERT INTO AREA_INFO VALUES ('2631', '210102', '和平区', '3', '210100', null, '1');
INSERT INTO AREA_INFO VALUES ('2632', '411426', '夏邑县', '3', '411400', null, '1');
INSERT INTO AREA_INFO VALUES ('2633', '411481', '永城市', '3', '411400', null, '1');
INSERT INTO AREA_INFO VALUES ('2634', '411622', '西华县', '3', '411600', null, '1');
INSERT INTO AREA_INFO VALUES ('2635', '420000', '湖北省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('2636', '420100', '武汉市', '2', '420000', null, '1');
INSERT INTO AREA_INFO VALUES ('2637', '420101', '市辖区', '3', '420100', null, '1');
INSERT INTO AREA_INFO VALUES ('2638', '420102', '江岸区', '3', '420100', null, '1');
INSERT INTO AREA_INFO VALUES ('2639', '420103', '江汉区', '3', '420100', null, '1');
INSERT INTO AREA_INFO VALUES ('2640', '420104', '硚口区', '3', '420100', null, '1');
INSERT INTO AREA_INFO VALUES ('2641', '420105', '汉阳区', '3', '420100', null, '1');
INSERT INTO AREA_INFO VALUES ('2642', '420106', '武昌区', '3', '420100', null, '1');
INSERT INTO AREA_INFO VALUES ('2643', '420107', '青山区', '3', '420100', null, '1');
INSERT INTO AREA_INFO VALUES ('2644', '420700', '鄂州市', '2', '420000', null, '1');
INSERT INTO AREA_INFO VALUES ('2645', '420701', '市辖区', '3', '420700', null, '1');
INSERT INTO AREA_INFO VALUES ('2646', '420702', '梁子湖区', '3', '420700', null, '1');
INSERT INTO AREA_INFO VALUES ('2647', '421000', '荆州市', '2', '420000', null, '1');
INSERT INTO AREA_INFO VALUES ('2648', '421001', '市辖区', '3', '421000', null, '1');
INSERT INTO AREA_INFO VALUES ('2649', '421002', '沙市区', '3', '421000', null, '1');
INSERT INTO AREA_INFO VALUES ('2650', '421003', '荆州区', '3', '421000', null, '1');
INSERT INTO AREA_INFO VALUES ('2651', '421022', '公安县', '3', '421000', null, '1');
INSERT INTO AREA_INFO VALUES ('2652', '421023', '监利县', '3', '421000', null, '1');
INSERT INTO AREA_INFO VALUES ('2653', '421024', '江陵县', '3', '421000', null, '1');
INSERT INTO AREA_INFO VALUES ('2654', '421081', '石首市', '3', '421000', null, '1');
INSERT INTO AREA_INFO VALUES ('2655', '421222', '通城县', '3', '421200', null, '1');
INSERT INTO AREA_INFO VALUES ('2656', '421223', '崇阳县', '3', '421200', null, '1');
INSERT INTO AREA_INFO VALUES ('2657', '421224', '通山县', '3', '421200', null, '1');
INSERT INTO AREA_INFO VALUES ('2658', '421281', '赤壁市', '3', '421200', null, '1');
INSERT INTO AREA_INFO VALUES ('2806', '532327', '永仁县', '3', '532300', null, '1');
INSERT INTO AREA_INFO VALUES ('2807', '532328', '元谋县', '3', '532300', null, '1');
INSERT INTO AREA_INFO VALUES ('2808', '532329', '武定县', '3', '532300', null, '1');
INSERT INTO AREA_INFO VALUES ('2809', '532331', '禄丰县', '3', '532300', null, '1');
INSERT INTO AREA_INFO VALUES ('2810', '532501', '个旧市', '3', '532500', null, '1');
INSERT INTO AREA_INFO VALUES ('2811', '532502', '开远市', '3', '532500', null, '1');
INSERT INTO AREA_INFO VALUES ('2812', '532522', '蒙自县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2813', '532523', '屏边苗族自治县', '3', '532500', null, '1');
INSERT INTO AREA_INFO VALUES ('2814', '532524', '建水县', '3', '532500', null, '1');
INSERT INTO AREA_INFO VALUES ('2815', '532525', '石屏县', '3', '532500', null, '1');
INSERT INTO AREA_INFO VALUES ('2816', '532526', '弥勒县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2817', '320502', '沧浪区', '3', '320500', null, '1');
INSERT INTO AREA_INFO VALUES ('2818', '320503', '平江区', '3', '320500', null, '1');
INSERT INTO AREA_INFO VALUES ('2819', '320504', '金阊区', '3', '320500', null, '1');
INSERT INTO AREA_INFO VALUES ('2820', '320505', '虎丘区', '3', '320500', null, '1');
INSERT INTO AREA_INFO VALUES ('2821', '320506', '吴中区', '3', '320500', null, '1');
INSERT INTO AREA_INFO VALUES ('2822', '320507', '相城区', '3', '320500', null, '1');
INSERT INTO AREA_INFO VALUES ('2823', '320581', '常熟市', '3', '320500', null, '1');
INSERT INTO AREA_INFO VALUES ('2824', '320582', '张家港市', '3', '320500', null, '1');
INSERT INTO AREA_INFO VALUES ('2825', '320583', '昆山市', '3', '320500', null, '1');
INSERT INTO AREA_INFO VALUES ('2826', '320584', '吴江市', '3', '320500', null, '1');
INSERT INTO AREA_INFO VALUES ('2827', '320585', '太仓市', '3', '320500', null, '1');
INSERT INTO AREA_INFO VALUES ('2828', '320600', '南通市', '2', '320000', null, '1');
INSERT INTO AREA_INFO VALUES ('2829', '320601', '市辖区', '3', '320600', null, '1');
INSERT INTO AREA_INFO VALUES ('2830', '320602', '崇川区', '3', '320600', null, '1');
INSERT INTO AREA_INFO VALUES ('2831', '320611', '港闸区', '3', '320600', null, '1');
INSERT INTO AREA_INFO VALUES ('2832', '320621', '海安县', '3', '320600', null, '1');
INSERT INTO AREA_INFO VALUES ('2833', '320623', '如东县', '3', '320600', null, '1');
INSERT INTO AREA_INFO VALUES ('2834', '320681', '启东市', '3', '320600', null, '1');
INSERT INTO AREA_INFO VALUES ('2835', '320682', '如皋市', '3', '320600', null, '1');
INSERT INTO AREA_INFO VALUES ('2836', '320683', '通州市', '3', '320600', null, '1');
INSERT INTO AREA_INFO VALUES ('2837', '320684', '海门市', '3', '320600', null, '1');
INSERT INTO AREA_INFO VALUES ('2838', '320700', '连云港市', '2', '320000', null, '1');
INSERT INTO AREA_INFO VALUES ('2839', '320701', '市辖区', '3', '320700', null, '1');
INSERT INTO AREA_INFO VALUES ('2840', '320703', '连云区', '3', '320700', null, '1');
INSERT INTO AREA_INFO VALUES ('2841', '320705', '新浦区', '3', '320700', null, '1');
INSERT INTO AREA_INFO VALUES ('2842', '320706', '海州区', '3', '320700', null, '1');
INSERT INTO AREA_INFO VALUES ('2843', '320721', '赣榆县', '3', '320700', null, '1');
INSERT INTO AREA_INFO VALUES ('2844', '320722', '东海县', '3', '320700', null, '1');
INSERT INTO AREA_INFO VALUES ('2845', '320723', '灌云县', '3', '320700', null, '1');
INSERT INTO AREA_INFO VALUES ('2846', '320724', '灌南县', '3', '320700', null, '1');
INSERT INTO AREA_INFO VALUES ('2847', '320800', '淮安市', '2', '320000', null, '1');
INSERT INTO AREA_INFO VALUES ('2848', '320801', '市辖区', '3', '320800', null, '1');
INSERT INTO AREA_INFO VALUES ('2849', '320802', '清河区', '3', '320800', null, '1');
INSERT INTO AREA_INFO VALUES ('2850', '320803', '楚州区', '3', '320800', null, '1');
INSERT INTO AREA_INFO VALUES ('2851', '320804', '淮阴区', '3', '320800', null, '1');
INSERT INTO AREA_INFO VALUES ('2852', '320811', '清浦区', '3', '320800', null, '1');
INSERT INTO AREA_INFO VALUES ('2853', '320826', '涟水县', '3', '320800', null, '1');
INSERT INTO AREA_INFO VALUES ('2854', '320829', '洪泽县', '3', '320800', null, '1');
INSERT INTO AREA_INFO VALUES ('2855', '320830', '盱眙县', '3', '320800', null, '1');
INSERT INTO AREA_INFO VALUES ('2856', '320831', '金湖县', '3', '320800', null, '1');
INSERT INTO AREA_INFO VALUES ('2857', '320900', '盐城市', '2', '320000', null, '1');
INSERT INTO AREA_INFO VALUES ('2858', '320901', '市辖区', '3', '320900', null, '1');
INSERT INTO AREA_INFO VALUES ('2859', '320902', '亭湖区', '3', '320900', null, '1');
INSERT INTO AREA_INFO VALUES ('2860', '320903', '盐都区', '3', '320900', null, '1');
INSERT INTO AREA_INFO VALUES ('2861', '320921', '响水县', '3', '320900', null, '1');
INSERT INTO AREA_INFO VALUES ('2862', '320922', '滨海县', '3', '320900', null, '1');
INSERT INTO AREA_INFO VALUES ('2863', '320923', '阜宁县', '3', '320900', null, '1');
INSERT INTO AREA_INFO VALUES ('2864', '320924', '射阳县', '3', '320900', null, '1');
INSERT INTO AREA_INFO VALUES ('2865', '320925', '建湖县', '3', '320900', null, '1');
INSERT INTO AREA_INFO VALUES ('2866', '320981', '东台市', '3', '320900', null, '1');
INSERT INTO AREA_INFO VALUES ('2867', '320982', '大丰市', '3', '320900', null, '1');
INSERT INTO AREA_INFO VALUES ('2868', '321000', '扬州市', '2', '320000', null, '1');
INSERT INTO AREA_INFO VALUES ('2869', '321001', '市辖区', '3', '321000', null, '1');
INSERT INTO AREA_INFO VALUES ('2870', '321002', '广陵区', '3', '321000', null, '1');
INSERT INTO AREA_INFO VALUES ('2871', '321003', '邗江区', '3', '321000', null, '1');
INSERT INTO AREA_INFO VALUES ('2872', '321011', '维扬区', '3', '321000', null, '1');
INSERT INTO AREA_INFO VALUES ('2873', '321023', '宝应县', '3', '321000', null, '1');
INSERT INTO AREA_INFO VALUES ('2874', '321081', '仪征市', '3', '321000', null, '1');
INSERT INTO AREA_INFO VALUES ('2875', '321084', '高邮市', '3', '321000', null, '1');
INSERT INTO AREA_INFO VALUES ('2876', '321088', '江都市', '3', '321000', null, '1');
INSERT INTO AREA_INFO VALUES ('2877', '321100', '镇江市', '2', '320000', null, '1');
INSERT INTO AREA_INFO VALUES ('2878', '321101', '市辖区', '3', '321100', null, '1');
INSERT INTO AREA_INFO VALUES ('2879', '321102', '京口区', '3', '321100', null, '1');
INSERT INTO AREA_INFO VALUES ('2880', '321111', '润州区', '3', '321100', null, '1');
INSERT INTO AREA_INFO VALUES ('2881', '321112', '丹徒区', '3', '321100', null, '1');
INSERT INTO AREA_INFO VALUES ('2882', '321200', '泰州市', '2', '320000', null, '1');
INSERT INTO AREA_INFO VALUES ('2883', '321201', '市辖区', '3', '321200', null, '1');
INSERT INTO AREA_INFO VALUES ('2884', '321202', '海陵区', '3', '321200', null, '1');
INSERT INTO AREA_INFO VALUES ('2885', '321203', '高港区', '3', '321200', null, '1');
INSERT INTO AREA_INFO VALUES ('2886', '321281', '兴化市', '3', '321200', null, '1');
INSERT INTO AREA_INFO VALUES ('2887', '321282', '靖江市', '3', '321200', null, '1');
INSERT INTO AREA_INFO VALUES ('2888', '321283', '泰兴市', '3', '321200', null, '1');
INSERT INTO AREA_INFO VALUES ('2889', '321284', '姜堰市', '3', '321200', null, '1');
INSERT INTO AREA_INFO VALUES ('2890', '321300', '宿迁市', '2', '320000', null, '1');
INSERT INTO AREA_INFO VALUES ('2891', '321301', '市辖区', '3', '321300', null, '1');
INSERT INTO AREA_INFO VALUES ('2892', '321302', '宿城区', '3', '321300', null, '1');
INSERT INTO AREA_INFO VALUES ('2893', '321311', '宿豫区', '3', '321300', null, '1');
INSERT INTO AREA_INFO VALUES ('2894', '321322', '沭阳县', '3', '321300', null, '1');
INSERT INTO AREA_INFO VALUES ('2895', '321323', '泗阳县', '3', '321300', null, '1');
INSERT INTO AREA_INFO VALUES ('2896', '321324', '泗洪县', '3', '321300', null, '1');
INSERT INTO AREA_INFO VALUES ('2897', '330000', '浙江省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('2898', '330100', '杭州市', '2', '330000', null, '1');
INSERT INTO AREA_INFO VALUES ('2899', '330101', '市辖区', '3', '330100', null, '1');
INSERT INTO AREA_INFO VALUES ('2900', '330102', '上城区', '3', '330100', null, '1');
INSERT INTO AREA_INFO VALUES ('2901', '330103', '下城区', '3', '330100', null, '1');
INSERT INTO AREA_INFO VALUES ('2902', '330104', '江干区', '3', '330100', null, '1');
INSERT INTO AREA_INFO VALUES ('2903', '330105', '拱墅区', '3', '330100', null, '1');
INSERT INTO AREA_INFO VALUES ('2904', '330106', '西湖区', '3', '330100', null, '1');
INSERT INTO AREA_INFO VALUES ('2905', '330108', '滨江区', '3', '330100', null, '1');
INSERT INTO AREA_INFO VALUES ('2906', '330109', '萧山区', '3', '330100', null, '1');
INSERT INTO AREA_INFO VALUES ('2907', '330110', '余杭区', '3', '330100', null, '1');
INSERT INTO AREA_INFO VALUES ('2908', '330122', '桐庐县', '3', '330100', null, '1');
INSERT INTO AREA_INFO VALUES ('2909', '330127', '淳安县', '3', '330100', null, '1');
INSERT INTO AREA_INFO VALUES ('2910', '330182', '建德市', '3', '330100', null, '1');
INSERT INTO AREA_INFO VALUES ('2911', '330183', '富阳市', '3', '330100', null, '1');
INSERT INTO AREA_INFO VALUES ('2912', '330185', '临安市', '3', '330100', null, '1');
INSERT INTO AREA_INFO VALUES ('2913', '330200', '宁波市', '2', '330000', null, '1');
INSERT INTO AREA_INFO VALUES ('2914', '330201', '市辖区', '3', '330200', null, '1');
INSERT INTO AREA_INFO VALUES ('2915', '330203', '海曙区', '3', '330200', null, '1');
INSERT INTO AREA_INFO VALUES ('2916', '330204', '江东区', '3', '330200', null, '1');
INSERT INTO AREA_INFO VALUES ('2917', '330205', '江北区', '3', '330200', null, '1');
INSERT INTO AREA_INFO VALUES ('2918', '330206', '北仑区', '3', '330200', null, '1');
INSERT INTO AREA_INFO VALUES ('2919', '330211', '镇海区', '3', '330200', null, '1');
INSERT INTO AREA_INFO VALUES ('2920', '330212', '鄞州区', '3', '330200', null, '1');
INSERT INTO AREA_INFO VALUES ('2921', '330225', '象山县', '3', '330200', null, '1');
INSERT INTO AREA_INFO VALUES ('2922', '330226', '宁海县', '3', '330200', null, '1');
INSERT INTO AREA_INFO VALUES ('2923', '330281', '余姚市', '3', '330200', null, '1');
INSERT INTO AREA_INFO VALUES ('2924', '330282', '慈溪市', '3', '330200', null, '1');
INSERT INTO AREA_INFO VALUES ('2925', '330283', '奉化市', '3', '330200', null, '1');
INSERT INTO AREA_INFO VALUES ('2926', '330300', '温州市', '2', '330000', null, '1');
INSERT INTO AREA_INFO VALUES ('2927', '330301', '市辖区', '3', '330300', null, '1');
INSERT INTO AREA_INFO VALUES ('2928', '330302', '鹿城区', '3', '330300', null, '1');
INSERT INTO AREA_INFO VALUES ('2929', '330303', '龙湾区', '3', '330300', null, '1');
INSERT INTO AREA_INFO VALUES ('2930', '330304', '瓯海区', '3', '330300', null, '1');
INSERT INTO AREA_INFO VALUES ('2931', '330322', '洞头县', '3', '330300', null, '1');
INSERT INTO AREA_INFO VALUES ('2932', '330324', '永嘉县', '3', '330300', null, '1');
INSERT INTO AREA_INFO VALUES ('2933', '330326', '平阳县', '3', '330300', null, '1');
INSERT INTO AREA_INFO VALUES ('2934', '330327', '苍南县', '3', '330300', null, '1');
INSERT INTO AREA_INFO VALUES ('2935', '330328', '文成县', '3', '330300', null, '1');
INSERT INTO AREA_INFO VALUES ('2936', '330381', '瑞安市', '3', '330300', null, '1');
INSERT INTO AREA_INFO VALUES ('2937', '330382', '乐清市', '3', '330300', null, '1');
INSERT INTO AREA_INFO VALUES ('2938', '330400', '嘉兴市', '2', '330000', null, '1');
INSERT INTO AREA_INFO VALUES ('2939', '330401', '市辖区', '3', '330400', null, '1');
INSERT INTO AREA_INFO VALUES ('2940', '330402', '秀城区', '3', '330400', null, '1');
INSERT INTO AREA_INFO VALUES ('2941', '330411', '秀洲区', '3', '330400', null, '1');
INSERT INTO AREA_INFO VALUES ('2942', '330421', '嘉善县', '3', '330400', null, '1');
INSERT INTO AREA_INFO VALUES ('2943', '330424', '海盐县', '3', '330400', null, '1');
INSERT INTO AREA_INFO VALUES ('2944', '330481', '海宁市', '3', '330400', null, '1');
INSERT INTO AREA_INFO VALUES ('2945', '330482', '平湖市', '3', '330400', null, '1');
INSERT INTO AREA_INFO VALUES ('2946', '330483', '桐乡市', '3', '330400', null, '1');
INSERT INTO AREA_INFO VALUES ('2947', '330500', '湖州市', '2', '330000', null, '1');
INSERT INTO AREA_INFO VALUES ('2948', '330501', '市辖区', '3', '330500', null, '1');
INSERT INTO AREA_INFO VALUES ('2949', '330502', '吴兴区', '3', '330500', null, '1');
INSERT INTO AREA_INFO VALUES ('2950', '330503', '南浔区', '3', '330500', null, '1');
INSERT INTO AREA_INFO VALUES ('2951', '330521', '德清县', '3', '330500', null, '1');
INSERT INTO AREA_INFO VALUES ('2952', '330522', '长兴县', '3', '330500', null, '1');
INSERT INTO AREA_INFO VALUES ('2659', '421300', '随州市', '2', '420000', null, '1');
INSERT INTO AREA_INFO VALUES ('2660', '421301', '市辖区', '3', '421300', null, '1');
INSERT INTO AREA_INFO VALUES ('2661', '421302', '曾都区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2662', '421381', '广水市', '3', '421300', null, '1');
INSERT INTO AREA_INFO VALUES ('2663', '422800', '恩施土家族苗族自治州', '2', '420000', null, '1');
INSERT INTO AREA_INFO VALUES ('2664', '422801', '恩施市', '3', '422800', null, '1');
INSERT INTO AREA_INFO VALUES ('2665', '422802', '利川市', '3', '422800', null, '1');
INSERT INTO AREA_INFO VALUES ('2666', '422822', '建始县', '3', '422800', null, '1');
INSERT INTO AREA_INFO VALUES ('2667', '422823', '巴东县', '3', '422800', null, '1');
INSERT INTO AREA_INFO VALUES ('2668', '422825', '宣恩县', '3', '422800', null, '1');
INSERT INTO AREA_INFO VALUES ('2669', '422826', '咸丰县', '3', '422800', null, '1');
INSERT INTO AREA_INFO VALUES ('2670', '422827', '来凤县', '3', '422800', null, '1');
INSERT INTO AREA_INFO VALUES ('2671', '422828', '鹤峰县', '3', '422800', null, '1');
INSERT INTO AREA_INFO VALUES ('2672', '429000', '省直辖行政单位', '2', '420000', null, '1');
INSERT INTO AREA_INFO VALUES ('2673', '429004', '仙桃市', '3', '429000', null, '1');
INSERT INTO AREA_INFO VALUES ('2674', '429005', '潜江市', '3', '429000', null, '1');
INSERT INTO AREA_INFO VALUES ('2675', '429006', '天门市', '3', '429000', null, '1');
INSERT INTO AREA_INFO VALUES ('2676', '429021', '神农架林区', '3', '429000', null, '1');
INSERT INTO AREA_INFO VALUES ('2677', '430000', '湖南省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('2678', '430100', '长沙市', '2', '430000', null, '1');
INSERT INTO AREA_INFO VALUES ('2679', '430400', '衡阳市', '2', '430000', null, '1');
INSERT INTO AREA_INFO VALUES ('2680', '430401', '市辖区', '3', '430400', null, '1');
INSERT INTO AREA_INFO VALUES ('2681', '430405', '珠晖区', '3', '430400', null, '1');
INSERT INTO AREA_INFO VALUES ('2682', '430406', '雁峰区', '3', '430400', null, '1');
INSERT INTO AREA_INFO VALUES ('2683', '430407', '石鼓区', '3', '430400', null, '1');
INSERT INTO AREA_INFO VALUES ('2684', '430408', '蒸湘区', '3', '430400', null, '1');
INSERT INTO AREA_INFO VALUES ('2685', '430412', '南岳区', '3', '430400', null, '1');
INSERT INTO AREA_INFO VALUES ('2686', '430421', '衡阳县', '3', '430400', null, '1');
INSERT INTO AREA_INFO VALUES ('2687', '430422', '衡南县', '3', '430400', null, '1');
INSERT INTO AREA_INFO VALUES ('2688', '430423', '衡山县', '3', '430400', null, '1');
INSERT INTO AREA_INFO VALUES ('2689', '430424', '衡东县', '3', '430400', null, '1');
INSERT INTO AREA_INFO VALUES ('2690', '430426', '祁东县', '3', '430400', null, '1');
INSERT INTO AREA_INFO VALUES ('2691', '430481', '耒阳市', '3', '430400', null, '1');
INSERT INTO AREA_INFO VALUES ('2692', '430482', '常宁市', '3', '430400', null, '1');
INSERT INTO AREA_INFO VALUES ('2693', '430500', '邵阳市', '2', '430000', null, '1');
INSERT INTO AREA_INFO VALUES ('2694', '430501', '市辖区', '3', '430500', null, '1');
INSERT INTO AREA_INFO VALUES ('2695', '430502', '双清区', '3', '430500', null, '1');
INSERT INTO AREA_INFO VALUES ('2696', '430503', '大祥区', '3', '430500', null, '1');
INSERT INTO AREA_INFO VALUES ('2697', '430511', '北塔区', '3', '430500', null, '1');
INSERT INTO AREA_INFO VALUES ('2698', '430521', '邵东县', '3', '430500', null, '1');
INSERT INTO AREA_INFO VALUES ('2699', '430522', '新邵县', '3', '430500', null, '1');
INSERT INTO AREA_INFO VALUES ('2700', '430523', '邵阳县', '3', '430500', null, '1');
INSERT INTO AREA_INFO VALUES ('2701', '430524', '隆回县', '3', '430500', null, '1');
INSERT INTO AREA_INFO VALUES ('2702', '430525', '洞口县', '3', '430500', null, '1');
INSERT INTO AREA_INFO VALUES ('2703', '430527', '绥宁县', '3', '430500', null, '1');
INSERT INTO AREA_INFO VALUES ('2704', '430528', '新宁县', '3', '430500', null, '1');
INSERT INTO AREA_INFO VALUES ('2705', '430529', '城步苗族自治县', '3', '430500', null, '1');
INSERT INTO AREA_INFO VALUES ('2706', '430581', '武冈市', '3', '430500', null, '1');
INSERT INTO AREA_INFO VALUES ('2707', '430600', '岳阳市', '2', '430000', null, '1');
INSERT INTO AREA_INFO VALUES ('2708', '430601', '市辖区', '3', '430600', null, '1');
INSERT INTO AREA_INFO VALUES ('2709', '430602', '岳阳楼区', '3', '430600', null, '1');
INSERT INTO AREA_INFO VALUES ('2710', '430603', '云溪区', '3', '430600', null, '1');
INSERT INTO AREA_INFO VALUES ('2711', '430611', '君山区', '3', '430600', null, '1');
INSERT INTO AREA_INFO VALUES ('2712', '430621', '岳阳县', '3', '430600', null, '1');
INSERT INTO AREA_INFO VALUES ('2713', '430623', '华容县', '3', '430600', null, '1');
INSERT INTO AREA_INFO VALUES ('2714', '430624', '湘阴县', '3', '430600', null, '1');
INSERT INTO AREA_INFO VALUES ('2715', '430626', '平江县', '3', '430600', null, '1');
INSERT INTO AREA_INFO VALUES ('2716', '430681', '汨罗市', '3', '430600', null, '1');
INSERT INTO AREA_INFO VALUES ('2717', '430682', '临湘市', '3', '430600', null, '1');
INSERT INTO AREA_INFO VALUES ('2718', '430700', '常德市', '2', '430000', null, '1');
INSERT INTO AREA_INFO VALUES ('2719', '430701', '市辖区', '3', '430700', null, '1');
INSERT INTO AREA_INFO VALUES ('2720', '430702', '武陵区', '3', '430700', null, '1');
INSERT INTO AREA_INFO VALUES ('2721', '430703', '鼎城区', '3', '430700', null, '1');
INSERT INTO AREA_INFO VALUES ('2722', '430721', '安乡县', '3', '430700', null, '1');
INSERT INTO AREA_INFO VALUES ('2723', '430722', '汉寿县', '3', '430700', null, '1');
INSERT INTO AREA_INFO VALUES ('2724', '430723', '澧县', '3', '430700', null, '1');
INSERT INTO AREA_INFO VALUES ('2725', '430724', '临澧县', '3', '430700', null, '1');
INSERT INTO AREA_INFO VALUES ('2726', '430725', '桃源县', '3', '430700', null, '1');
INSERT INTO AREA_INFO VALUES ('2727', '430726', '石门县', '3', '430700', null, '1');
INSERT INTO AREA_INFO VALUES ('2728', '430781', '津市市', '3', '430700', null, '1');
INSERT INTO AREA_INFO VALUES ('2729', '430800', '张家界市', '2', '430000', null, '1');
INSERT INTO AREA_INFO VALUES ('2730', '430801', '市辖区', '3', '430800', null, '1');
INSERT INTO AREA_INFO VALUES ('2731', '430802', '永定区', '3', '430800', null, '1');
INSERT INTO AREA_INFO VALUES ('2732', '430811', '武陵源区', '3', '430800', null, '1');
INSERT INTO AREA_INFO VALUES ('2733', '430821', '慈利县', '3', '430800', null, '1');
INSERT INTO AREA_INFO VALUES ('2734', '430822', '桑植县', '3', '430800', null, '1');
INSERT INTO AREA_INFO VALUES ('2735', '430900', '益阳市', '2', '430000', null, '1');
INSERT INTO AREA_INFO VALUES ('2736', '431021', '桂阳县', '3', '431000', null, '1');
INSERT INTO AREA_INFO VALUES ('2737', '431022', '宜章县', '3', '431000', null, '1');
INSERT INTO AREA_INFO VALUES ('2738', '431023', '永兴县', '3', '431000', null, '1');
INSERT INTO AREA_INFO VALUES ('2739', '431024', '嘉禾县', '3', '431000', null, '1');
INSERT INTO AREA_INFO VALUES ('2740', '431025', '临武县', '3', '431000', null, '1');
INSERT INTO AREA_INFO VALUES ('2741', '431230', '通道侗族自治县', '3', '431200', null, '1');
INSERT INTO AREA_INFO VALUES ('2742', '431281', '洪江市', '3', '431200', null, '1');
INSERT INTO AREA_INFO VALUES ('2743', '431300', '娄底市', '2', '430000', null, '1');
INSERT INTO AREA_INFO VALUES ('2744', '431301', '市辖区', '3', '431300', null, '1');
INSERT INTO AREA_INFO VALUES ('2745', '431302', '娄星区', '3', '431300', null, '1');
INSERT INTO AREA_INFO VALUES ('2746', '431321', '双峰县', '3', '431300', null, '1');
INSERT INTO AREA_INFO VALUES ('2747', '431322', '新化县', '3', '431300', null, '1');
INSERT INTO AREA_INFO VALUES ('2748', '431381', '冷水江市', '3', '431300', null, '1');
INSERT INTO AREA_INFO VALUES ('2749', '431382', '涟源市', '3', '431300', null, '1');
INSERT INTO AREA_INFO VALUES ('2750', '433100', '湘西土家族苗族自治州', '2', '430000', null, '1');
INSERT INTO AREA_INFO VALUES ('2751', '433101', '吉首市', '3', '433100', null, '1');
INSERT INTO AREA_INFO VALUES ('2752', '433122', '泸溪县', '3', '433100', null, '1');
INSERT INTO AREA_INFO VALUES ('2753', '433123', '凤凰县', '3', '433100', null, '1');
INSERT INTO AREA_INFO VALUES ('2754', '433124', '花垣县', '3', '433100', null, '1');
INSERT INTO AREA_INFO VALUES ('2755', '433130', '龙山县', '3', '433100', null, '1');
INSERT INTO AREA_INFO VALUES ('2756', '440115', '南沙区', '3', '440100', null, '1');
INSERT INTO AREA_INFO VALUES ('2757', '440116', '萝岗区', '3', '440100', null, '1');
INSERT INTO AREA_INFO VALUES ('2758', '440183', '增城市', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2759', '440184', '从化市', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2760', '440200', '韶关市', '2', '440000', null, '1');
INSERT INTO AREA_INFO VALUES ('2761', '440205', '曲江区', '3', '440200', null, '1');
INSERT INTO AREA_INFO VALUES ('2762', '440222', '始兴县', '3', '440200', null, '1');
INSERT INTO AREA_INFO VALUES ('2763', '440224', '仁化县', '3', '440200', null, '1');
INSERT INTO AREA_INFO VALUES ('2764', '440304', '福田区', '3', '440300', null, '1');
INSERT INTO AREA_INFO VALUES ('2765', '440305', '南山区', '3', '440300', null, '1');
INSERT INTO AREA_INFO VALUES ('2766', '440306', '宝安区', '3', '440300', null, '1');
INSERT INTO AREA_INFO VALUES ('2767', '440307', '龙岗区', '3', '440300', null, '1');
INSERT INTO AREA_INFO VALUES ('2768', '440308', '盐田区', '3', '440300', null, '1');
INSERT INTO AREA_INFO VALUES ('2769', '440400', '珠海市', '2', '440000', null, '1');
INSERT INTO AREA_INFO VALUES ('2770', '440401', '市辖区', '3', '440400', null, '1');
INSERT INTO AREA_INFO VALUES ('2771', '440402', '香洲区', '3', '440400', null, '1');
INSERT INTO AREA_INFO VALUES ('2772', '440403', '斗门区', '3', '440400', null, '1');
INSERT INTO AREA_INFO VALUES ('2773', '440404', '金湾区', '3', '440400', null, '1');
INSERT INTO AREA_INFO VALUES ('2774', '440500', '汕头市', '2', '440000', null, '1');
INSERT INTO AREA_INFO VALUES ('2775', '440501', '市辖区', '3', '440500', null, '1');
INSERT INTO AREA_INFO VALUES ('2776', '440507', '龙湖区', '3', '440500', null, '1');
INSERT INTO AREA_INFO VALUES ('2777', '440511', '金平区', '3', '440500', null, '1');
INSERT INTO AREA_INFO VALUES ('2778', '440512', '濠江区', '3', '440500', null, '1');
INSERT INTO AREA_INFO VALUES ('2779', '440513', '潮阳区', '3', '440500', null, '1');
INSERT INTO AREA_INFO VALUES ('2780', '440514', '潮南区', '3', '440500', null, '1');
INSERT INTO AREA_INFO VALUES ('2781', '440515', '澄海区', '3', '440500', null, '1');
INSERT INTO AREA_INFO VALUES ('2782', '440523', '南澳县', '3', '440500', null, '1');
INSERT INTO AREA_INFO VALUES ('2783', '440600', '佛山市', '2', '440000', null, '1');
INSERT INTO AREA_INFO VALUES ('2784', '440601', '市辖区', '3', '440600', null, '1');
INSERT INTO AREA_INFO VALUES ('2785', '530630', '水富县', '3', '530600', null, '1');
INSERT INTO AREA_INFO VALUES ('2786', '530700', '丽江市', '2', '530000', null, '1');
INSERT INTO AREA_INFO VALUES ('2787', '530701', '市辖区', '3', '530700', null, '1');
INSERT INTO AREA_INFO VALUES ('2788', '530702', '古城区', '3', '530700', null, '1');
INSERT INTO AREA_INFO VALUES ('2789', '530829', '西盟佤族自治县', '3', '530800', null, '1');
INSERT INTO AREA_INFO VALUES ('2790', '530900', '临沧市', '2', '530000', null, '1');
INSERT INTO AREA_INFO VALUES ('2791', '530901', '市辖区', '3', '530900', null, '1');
INSERT INTO AREA_INFO VALUES ('2792', '530902', '临翔区', '3', '530900', null, '1');
INSERT INTO AREA_INFO VALUES ('2793', '530921', '凤庆县', '3', '530900', null, '1');
INSERT INTO AREA_INFO VALUES ('2794', '530922', '云县', '3', '530900', null, '1');
INSERT INTO AREA_INFO VALUES ('2795', '530923', '永德县', '3', '530900', null, '1');
INSERT INTO AREA_INFO VALUES ('2796', '530924', '镇康县', '3', '530900', null, '1');
INSERT INTO AREA_INFO VALUES ('2797', '530926', '耿马傣族佤族自治县', '3', '530900', null, '1');
INSERT INTO AREA_INFO VALUES ('2798', '530927', '沧源佤族自治县', '3', '530900', null, '1');
INSERT INTO AREA_INFO VALUES ('2799', '532300', '楚雄彝族自治州', '2', '530000', null, '1');
INSERT INTO AREA_INFO VALUES ('2800', '532301', '楚雄市', '3', '532300', null, '1');
INSERT INTO AREA_INFO VALUES ('2801', '532322', '双柏县', '3', '532300', null, '1');
INSERT INTO AREA_INFO VALUES ('2802', '532323', '牟定县', '3', '532300', null, '1');
INSERT INTO AREA_INFO VALUES ('2803', '532324', '南华县', '3', '532300', null, '1');
INSERT INTO AREA_INFO VALUES ('2804', '532325', '姚安县', '3', '532300', null, '1');
INSERT INTO AREA_INFO VALUES ('2805', '532326', '大姚县', '3', '532300', null, '1');
INSERT INTO AREA_INFO VALUES ('1921', '530822', '墨江哈尼族自治县', '3', '530800', null, '1');
INSERT INTO AREA_INFO VALUES ('1922', '530823', '景东彝族自治县', '3', '530800', null, '1');
INSERT INTO AREA_INFO VALUES ('1923', '530824', '景谷傣族彝族自治县', '3', '530800', null, '1');
INSERT INTO AREA_INFO VALUES ('1924', '530826', '江城哈尼族彝族自治县', '3', '530800', null, '1');
INSERT INTO AREA_INFO VALUES ('1925', '530828', '澜沧拉祜族自治县', '3', '530800', null, '1');
INSERT INTO AREA_INFO VALUES ('1926', '532500', '红河哈尼族彝族自治州', '2', '530000', null, '1');
INSERT INTO AREA_INFO VALUES ('1927', '610528', '富平县', '3', '610500', null, '1');
INSERT INTO AREA_INFO VALUES ('1928', '610581', '韩城市', '3', '610500', null, '1');
INSERT INTO AREA_INFO VALUES ('1929', '610582', '华阴市', '3', '610500', null, '1');
INSERT INTO AREA_INFO VALUES ('1930', '610600', '延安市', '2', '610000', null, '1');
INSERT INTO AREA_INFO VALUES ('1931', '610601', '市辖区', '3', '610600', null, '1');
INSERT INTO AREA_INFO VALUES ('1932', '610602', '宝塔区', '3', '610600', null, '1');
INSERT INTO AREA_INFO VALUES ('1933', '610621', '延长县', '3', '610600', null, '1');
INSERT INTO AREA_INFO VALUES ('1934', '610622', '延川县', '3', '610600', null, '1');
INSERT INTO AREA_INFO VALUES ('1935', '610623', '子长县', '3', '610600', null, '1');
INSERT INTO AREA_INFO VALUES ('1936', '610624', '安塞县', '3', '610600', null, '1');
INSERT INTO AREA_INFO VALUES ('1937', '610625', '志丹县', '3', '610600', null, '1');
INSERT INTO AREA_INFO VALUES ('1938', '610626', '吴起县', '3', '610600', null, '1');
INSERT INTO AREA_INFO VALUES ('1939', '610627', '甘泉县', '3', '610600', null, '1');
INSERT INTO AREA_INFO VALUES ('1940', '610628', '富县', '3', '610600', null, '1');
INSERT INTO AREA_INFO VALUES ('1941', '610629', '洛川县', '3', '610600', null, '1');
INSERT INTO AREA_INFO VALUES ('1942', '610630', '宜川县', '3', '610600', null, '1');
INSERT INTO AREA_INFO VALUES ('1943', '610631', '黄龙县', '3', '610600', null, '1');
INSERT INTO AREA_INFO VALUES ('1944', '610632', '黄陵县', '3', '610600', null, '1');
INSERT INTO AREA_INFO VALUES ('1945', '610700', '汉中市', '2', '610000', null, '1');
INSERT INTO AREA_INFO VALUES ('1946', '610701', '市辖区', '3', '610700', null, '1');
INSERT INTO AREA_INFO VALUES ('1947', '610702', '汉台区', '3', '610700', null, '1');
INSERT INTO AREA_INFO VALUES ('1948', '610721', '南郑县', '3', '610700', null, '1');
INSERT INTO AREA_INFO VALUES ('1949', '610722', '城固县', '3', '610700', null, '1');
INSERT INTO AREA_INFO VALUES ('1950', '610723', '洋县', '3', '610700', null, '1');
INSERT INTO AREA_INFO VALUES ('1951', '610724', '西乡县', '3', '610700', null, '1');
INSERT INTO AREA_INFO VALUES ('1952', '610725', '勉县', '3', '610700', null, '1');
INSERT INTO AREA_INFO VALUES ('1953', '610726', '宁强县', '3', '610700', null, '1');
INSERT INTO AREA_INFO VALUES ('1954', '610727', '略阳县', '3', '610700', null, '1');
INSERT INTO AREA_INFO VALUES ('1955', '610728', '镇巴县', '3', '610700', null, '1');
INSERT INTO AREA_INFO VALUES ('1956', '610729', '留坝县', '3', '610700', null, '1');
INSERT INTO AREA_INFO VALUES ('1957', '610730', '佛坪县', '3', '610700', null, '1');
INSERT INTO AREA_INFO VALUES ('1958', '610800', '榆林市', '2', '610000', null, '1');
INSERT INTO AREA_INFO VALUES ('1959', '610801', '市辖区', '3', '610800', null, '1');
INSERT INTO AREA_INFO VALUES ('1960', '610825', '定边县', '3', '610800', null, '1');
INSERT INTO AREA_INFO VALUES ('1961', '610826', '绥德县', '3', '610800', null, '1');
INSERT INTO AREA_INFO VALUES ('1962', '610827', '米脂县', '3', '610800', null, '1');
INSERT INTO AREA_INFO VALUES ('1963', '610828', '佳县', '3', '610800', null, '1');
INSERT INTO AREA_INFO VALUES ('1964', '610829', '吴堡县', '3', '610800', null, '1');
INSERT INTO AREA_INFO VALUES ('1965', '610830', '清涧县', '3', '610800', null, '1');
INSERT INTO AREA_INFO VALUES ('1966', '610831', '子洲县', '3', '610800', null, '1');
INSERT INTO AREA_INFO VALUES ('1967', '610900', '安康市', '2', '610000', null, '1');
INSERT INTO AREA_INFO VALUES ('1968', '610901', '市辖区', '3', '610900', null, '1');
INSERT INTO AREA_INFO VALUES ('1969', '610902', '汉滨区', '3', '610900', null, '1');
INSERT INTO AREA_INFO VALUES ('1970', '610923', '宁陕县', '3', '610900', null, '1');
INSERT INTO AREA_INFO VALUES ('1971', '610924', '紫阳县', '3', '610900', null, '1');
INSERT INTO AREA_INFO VALUES ('1972', '610925', '岚皋县', '3', '610900', null, '1');
INSERT INTO AREA_INFO VALUES ('1973', '610926', '平利县', '3', '610900', null, '1');
INSERT INTO AREA_INFO VALUES ('1974', '610927', '镇坪县', '3', '610900', null, '1');
INSERT INTO AREA_INFO VALUES ('1975', '610928', '旬阳县', '3', '610900', null, '1');
INSERT INTO AREA_INFO VALUES ('1976', '610929', '白河县', '3', '610900', null, '1');
INSERT INTO AREA_INFO VALUES ('1977', '611000', '商洛市', '2', '610000', null, '1');
INSERT INTO AREA_INFO VALUES ('1978', '611001', '市辖区', '3', '611000', null, '1');
INSERT INTO AREA_INFO VALUES ('1979', '611002', '商州区', '3', '611000', null, '1');
INSERT INTO AREA_INFO VALUES ('1980', '620104', '西固区', '3', '620100', null, '1');
INSERT INTO AREA_INFO VALUES ('1981', '620105', '安宁区', '3', '620100', null, '1');
INSERT INTO AREA_INFO VALUES ('1982', '620111', '红古区', '3', '620100', null, '1');
INSERT INTO AREA_INFO VALUES ('1983', '620121', '永登县', '3', '620100', null, '1');
INSERT INTO AREA_INFO VALUES ('1984', '620122', '皋兰县', '3', '620100', null, '1');
INSERT INTO AREA_INFO VALUES ('1985', '620123', '榆中县', '3', '620100', null, '1');
INSERT INTO AREA_INFO VALUES ('1986', '620200', '嘉峪关市', '2', '620000', null, '1');
INSERT INTO AREA_INFO VALUES ('1987', '620201', '市辖区', '3', '620200', null, '1');
INSERT INTO AREA_INFO VALUES ('1988', '620300', '金昌市', '2', '620000', null, '1');
INSERT INTO AREA_INFO VALUES ('1989', '620301', '市辖区', '3', '620300', null, '1');
INSERT INTO AREA_INFO VALUES ('1990', '620302', '金川区', '3', '620300', null, '1');
INSERT INTO AREA_INFO VALUES ('1991', '620321', '永昌县', '3', '620300', null, '1');
INSERT INTO AREA_INFO VALUES ('1992', '620400', '白银市', '2', '620000', null, '1');
INSERT INTO AREA_INFO VALUES ('1993', '620401', '市辖区', '3', '620400', null, '1');
INSERT INTO AREA_INFO VALUES ('1994', '620402', '白银区', '3', '620400', null, '1');
INSERT INTO AREA_INFO VALUES ('1995', '620403', '平川区', '3', '620400', null, '1');
INSERT INTO AREA_INFO VALUES ('1996', '620421', '靖远县', '3', '620400', null, '1');
INSERT INTO AREA_INFO VALUES ('1997', '620702', '甘州区', '3', '620700', null, '1');
INSERT INTO AREA_INFO VALUES ('1998', '620721', '肃南裕固族自治县', '3', '620700', null, '1');
INSERT INTO AREA_INFO VALUES ('1999', '620722', '民乐县', '3', '620700', null, '1');
INSERT INTO AREA_INFO VALUES ('2000', '620723', '临泽县', '3', '620700', null, '1');
INSERT INTO AREA_INFO VALUES ('2001', '620724', '高台县', '3', '620700', null, '1');
INSERT INTO AREA_INFO VALUES ('2002', '620725', '山丹县', '3', '620700', null, '1');
INSERT INTO AREA_INFO VALUES ('2003', '620800', '平凉市', '2', '620000', null, '1');
INSERT INTO AREA_INFO VALUES ('2004', '620802', '崆峒区', '3', '620800', null, '1');
INSERT INTO AREA_INFO VALUES ('2005', '620821', '泾川县', '3', '620800', null, '1');
INSERT INTO AREA_INFO VALUES ('2006', '620822', '灵台县', '3', '620800', null, '1');
INSERT INTO AREA_INFO VALUES ('2007', '620823', '崇信县', '3', '620800', null, '1');
INSERT INTO AREA_INFO VALUES ('2008', '620824', '华亭县', '3', '620800', null, '1');
INSERT INTO AREA_INFO VALUES ('2009', '620825', '庄浪县', '3', '620800', null, '1');
INSERT INTO AREA_INFO VALUES ('2010', '620826', '静宁县', '3', '620800', null, '1');
INSERT INTO AREA_INFO VALUES ('2011', '620900', '酒泉市', '2', '620000', null, '1');
INSERT INTO AREA_INFO VALUES ('2012', '620901', '市辖区', '3', '620900', null, '1');
INSERT INTO AREA_INFO VALUES ('2013', '620902', '肃州区', '3', '620900', null, '1');
INSERT INTO AREA_INFO VALUES ('2014', '620921', '金塔县', '3', '620900', null, '1');
INSERT INTO AREA_INFO VALUES ('2015', '620922', '瓜州县', '3', '620900', null, '1');
INSERT INTO AREA_INFO VALUES ('2016', '620923', '肃北蒙古族自治县', '3', '620900', null, '1');
INSERT INTO AREA_INFO VALUES ('2017', '620924', '阿克塞哈萨克族自治县', '3', '620900', null, '1');
INSERT INTO AREA_INFO VALUES ('2018', '621122', '陇西县', '3', '621100', null, '1');
INSERT INTO AREA_INFO VALUES ('2019', '621123', '渭源县', '3', '621100', null, '1');
INSERT INTO AREA_INFO VALUES ('2020', '621124', '临洮县', '3', '621100', null, '1');
INSERT INTO AREA_INFO VALUES ('2021', '621125', '漳县', '3', '621100', null, '1');
INSERT INTO AREA_INFO VALUES ('2022', '621200', '陇南市', '2', '620000', null, '1');
INSERT INTO AREA_INFO VALUES ('2023', '621201', '市辖区', '3', '621200', null, '1');
INSERT INTO AREA_INFO VALUES ('2024', '621222', '文县', '3', '621200', null, '1');
INSERT INTO AREA_INFO VALUES ('2025', '621223', '宕昌县', '3', '621200', null, '1');
INSERT INTO AREA_INFO VALUES ('2026', '621224', '康县', '3', '621200', null, '1');
INSERT INTO AREA_INFO VALUES ('2027', '621225', '西和县', '3', '621200', null, '1');
INSERT INTO AREA_INFO VALUES ('2028', '621226', '礼县', '3', '621200', null, '1');
INSERT INTO AREA_INFO VALUES ('2029', '621227', '徽县', '3', '621200', null, '1');
INSERT INTO AREA_INFO VALUES ('2030', '623021', '临潭县', '3', '623000', null, '1');
INSERT INTO AREA_INFO VALUES ('2031', '623022', '卓尼县', '3', '623000', null, '1');
INSERT INTO AREA_INFO VALUES ('2032', '623023', '舟曲县', '3', '623000', null, '1');
INSERT INTO AREA_INFO VALUES ('2033', '623024', '迭部县', '3', '623000', null, '1');
INSERT INTO AREA_INFO VALUES ('2034', '623025', '玛曲县', '3', '623000', null, '1');
INSERT INTO AREA_INFO VALUES ('2035', '623026', '碌曲县', '3', '623000', null, '1');
INSERT INTO AREA_INFO VALUES ('2036', '623027', '夏河县', '3', '623000', null, '1');
INSERT INTO AREA_INFO VALUES ('2037', '630000', '青海省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('2038', '630100', '西宁市', '2', '630000', null, '1');
INSERT INTO AREA_INFO VALUES ('2039', '630101', '市辖区', '3', '630100', null, '1');
INSERT INTO AREA_INFO VALUES ('2040', '632600', '果洛藏族自治州', '2', '630000', null, '1');
INSERT INTO AREA_INFO VALUES ('2041', '632724', '治多县', '3', '632700', null, '1');
INSERT INTO AREA_INFO VALUES ('2042', '632725', '囊谦县', '3', '632700', null, '1');
INSERT INTO AREA_INFO VALUES ('2043', '650105', '水磨沟区', '3', '650100', null, '1');
INSERT INTO AREA_INFO VALUES ('2044', '650106', '头屯河区', '3', '650100', null, '1');
INSERT INTO AREA_INFO VALUES ('2045', '650107', '达坂城区', '3', '650100', null, '1');
INSERT INTO AREA_INFO VALUES ('2046', '650108', '东山区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2047', '650121', '乌鲁木齐县', '3', '650100', null, '1');
INSERT INTO AREA_INFO VALUES ('2048', '650200', '克拉玛依市', '2', '650000', null, '1');
INSERT INTO AREA_INFO VALUES ('2049', '652222', '巴里坤哈萨克自治县', '3', '652200', null, '1');
INSERT INTO AREA_INFO VALUES ('2050', '652223', '伊吾县', '3', '652200', null, '1');
INSERT INTO AREA_INFO VALUES ('2051', '652300', '昌吉回族自治州', '2', '650000', null, '1');
INSERT INTO AREA_INFO VALUES ('2052', '652301', '昌吉市', '3', '652300', null, '1');
INSERT INTO AREA_INFO VALUES ('2053', '652302', '阜康市', '3', '652300', null, '1');
INSERT INTO AREA_INFO VALUES ('2054', '652722', '精河县', '3', '652700', null, '1');
INSERT INTO AREA_INFO VALUES ('2055', '652723', '温泉县', '3', '652700', null, '1');
INSERT INTO AREA_INFO VALUES ('2056', '652800', '巴音郭楞蒙古自治州', '2', '650000', null, '1');
INSERT INTO AREA_INFO VALUES ('2057', '652928', '阿瓦提县', '3', '652900', null, '1');
INSERT INTO AREA_INFO VALUES ('2058', '652929', '柯坪县', '3', '652900', null, '1');
INSERT INTO AREA_INFO VALUES ('2059', '654202', '乌苏市', '3', '654200', null, '1');
INSERT INTO AREA_INFO VALUES ('2060', '654221', '额敏县', '3', '654200', null, '1');
INSERT INTO AREA_INFO VALUES ('2061', '654223', '沙湾县', '3', '654200', null, '1');
INSERT INTO AREA_INFO VALUES ('2062', '654224', '托里县', '3', '654200', null, '1');
INSERT INTO AREA_INFO VALUES ('2063', '654225', '裕民县', '3', '654200', null, '1');
INSERT INTO AREA_INFO VALUES ('2064', '654323', '福海县', '3', '654300', null, '1');
INSERT INTO AREA_INFO VALUES ('2065', '654324', '哈巴河县', '3', '654300', null, '1');
INSERT INTO AREA_INFO VALUES ('2066', '810000', '香港特别行政区', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('2067', '820000', '澳门特别行政区', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('2069', '621126', '岷县', '3', '621100', null, '1');
INSERT INTO AREA_INFO VALUES ('2070', '451226', '环江毛南族自治县', '3', '451200', null, '1');
INSERT INTO AREA_INFO VALUES ('2071', '451227', '巴马瑶族自治县', '3', '451200', null, '1');
INSERT INTO AREA_INFO VALUES ('2072', '451228', '都安瑶族自治县', '3', '451200', null, '1');
INSERT INTO AREA_INFO VALUES ('2073', '451229', '大化瑶族自治县', '3', '451200', null, '1');
INSERT INTO AREA_INFO VALUES ('2074', '451281', '宜州市', '3', '451200', null, '1');
INSERT INTO AREA_INFO VALUES ('2075', '451300', '来宾市', '2', '450000', null, '1');
INSERT INTO AREA_INFO VALUES ('2076', '451301', '市辖区', '3', '451300', null, '1');
INSERT INTO AREA_INFO VALUES ('2077', '460105', '秀英区', '3', '460100', null, '1');
INSERT INTO AREA_INFO VALUES ('2078', '460106', '龙华区', '3', '460100', null, '1');
INSERT INTO AREA_INFO VALUES ('2079', '500114', '黔江区', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('2080', '500227', '璧山县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2081', '500228', '梁平县', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('2082', '500229', '城口县', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('2083', '500230', '丰都县', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('2084', '500231', '垫江县', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('2085', '500232', '武隆县', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('2086', '500233', '忠县', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('2087', '513229', '马尔康县', '3', '513200', null, '1');
INSERT INTO AREA_INFO VALUES ('2088', '500234', '开县', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('2089', '500243', '彭水苗族土家族自治县', '3', '500100', null, '1');
INSERT INTO AREA_INFO VALUES ('2090', '510000', '四川省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('2091', '510100', '成都市', '2', '510000', null, '1');
INSERT INTO AREA_INFO VALUES ('2092', '510101', '市辖区', '3', '510100', null, '1');
INSERT INTO AREA_INFO VALUES ('2093', '510104', '锦江区', '3', '510100', null, '1');
INSERT INTO AREA_INFO VALUES ('2094', '510105', '青羊区', '3', '510100', null, '1');
INSERT INTO AREA_INFO VALUES ('2095', '510106', '金牛区', '3', '510100', null, '1');
INSERT INTO AREA_INFO VALUES ('2096', '510107', '武侯区', '3', '510100', null, '1');
INSERT INTO AREA_INFO VALUES ('2097', '510108', '成华区', '3', '510100', null, '1');
INSERT INTO AREA_INFO VALUES ('2098', '510112', '龙泉驿区', '3', '510100', null, '1');
INSERT INTO AREA_INFO VALUES ('2099', '510113', '青白江区', '3', '510100', null, '1');
INSERT INTO AREA_INFO VALUES ('2100', '510114', '新都区', '3', '510100', null, '1');
INSERT INTO AREA_INFO VALUES ('2101', '510122', '双流县', '3', '510100', null, '1');
INSERT INTO AREA_INFO VALUES ('2102', '510321', '荣县', '3', '510300', null, '1');
INSERT INTO AREA_INFO VALUES ('2103', '510322', '富顺县', '3', '510300', null, '1');
INSERT INTO AREA_INFO VALUES ('2104', '510400', '攀枝花市', '2', '510000', null, '1');
INSERT INTO AREA_INFO VALUES ('2105', '510401', '市辖区', '3', '510400', null, '1');
INSERT INTO AREA_INFO VALUES ('2106', '510402', '东区', '3', '510400', null, '1');
INSERT INTO AREA_INFO VALUES ('2107', '510403', '西区', '3', '510400', null, '1');
INSERT INTO AREA_INFO VALUES ('2108', '510601', '市辖区', '3', '510600', null, '1');
INSERT INTO AREA_INFO VALUES ('2109', '510603', '旌阳区', '3', '510600', null, '1');
INSERT INTO AREA_INFO VALUES ('2110', '510623', '中江县', '3', '510600', null, '1');
INSERT INTO AREA_INFO VALUES ('2111', '510626', '罗江县', '3', '510600', null, '1');
INSERT INTO AREA_INFO VALUES ('2112', '510681', '广汉市', '3', '510600', null, '1');
INSERT INTO AREA_INFO VALUES ('2113', '510682', '什邡市', '3', '510600', null, '1');
INSERT INTO AREA_INFO VALUES ('2114', '510683', '绵竹市', '3', '510600', null, '1');
INSERT INTO AREA_INFO VALUES ('2115', '510700', '绵阳市', '2', '510000', null, '1');
INSERT INTO AREA_INFO VALUES ('2116', '510701', '市辖区', '3', '510700', null, '1');
INSERT INTO AREA_INFO VALUES ('2117', '510704', '游仙区', '3', '510700', null, '1');
INSERT INTO AREA_INFO VALUES ('2118', '510722', '三台县', '3', '510700', null, '1');
INSERT INTO AREA_INFO VALUES ('2119', '510723', '盐亭县', '3', '510700', null, '1');
INSERT INTO AREA_INFO VALUES ('2120', '510724', '安县', '3', '510700', null, '1');
INSERT INTO AREA_INFO VALUES ('2121', '510811', '元坝区', '3', '510800', null, '1');
INSERT INTO AREA_INFO VALUES ('2122', '510812', '朝天区', '3', '510800', null, '1');
INSERT INTO AREA_INFO VALUES ('2123', '510821', '旺苍县', '3', '510800', null, '1');
INSERT INTO AREA_INFO VALUES ('2124', '510822', '青川县', '3', '510800', null, '1');
INSERT INTO AREA_INFO VALUES ('2125', '510823', '剑阁县', '3', '510800', null, '1');
INSERT INTO AREA_INFO VALUES ('2126', '510824', '苍溪县', '3', '510800', null, '1');
INSERT INTO AREA_INFO VALUES ('2127', '510900', '遂宁市', '2', '510000', null, '1');
INSERT INTO AREA_INFO VALUES ('2128', '510901', '市辖区', '3', '510900', null, '1');
INSERT INTO AREA_INFO VALUES ('2129', '510903', '船山区', '3', '510900', null, '1');
INSERT INTO AREA_INFO VALUES ('2130', '510904', '安居区', '3', '510900', null, '1');
INSERT INTO AREA_INFO VALUES ('2131', '510921', '蓬溪县', '3', '510900', null, '1');
INSERT INTO AREA_INFO VALUES ('2132', '510922', '射洪县', '3', '510900', null, '1');
INSERT INTO AREA_INFO VALUES ('2133', '510923', '大英县', '3', '510900', null, '1');
INSERT INTO AREA_INFO VALUES ('2134', '511000', '内江市', '2', '510000', null, '1');
INSERT INTO AREA_INFO VALUES ('2135', '511001', '市辖区', '3', '511000', null, '1');
INSERT INTO AREA_INFO VALUES ('2136', '511002', '市中区', '3', '511000', null, '1');
INSERT INTO AREA_INFO VALUES ('2137', '511011', '东兴区', '3', '511000', null, '1');
INSERT INTO AREA_INFO VALUES ('2138', '511024', '威远县', '3', '511000', null, '1');
INSERT INTO AREA_INFO VALUES ('2139', '511025', '资中县', '3', '511000', null, '1');
INSERT INTO AREA_INFO VALUES ('2140', '511028', '隆昌县', '3', '511000', null, '1');
INSERT INTO AREA_INFO VALUES ('2141', '511100', '乐山市', '2', '510000', null, '1');
INSERT INTO AREA_INFO VALUES ('2142', '511101', '市辖区', '3', '511100', null, '1');
INSERT INTO AREA_INFO VALUES ('2143', '511102', '市中区', '3', '511100', null, '1');
INSERT INTO AREA_INFO VALUES ('2144', '511111', '沙湾区', '3', '511100', null, '1');
INSERT INTO AREA_INFO VALUES ('2145', '511112', '五通桥区', '3', '511100', null, '1');
INSERT INTO AREA_INFO VALUES ('2146', '511113', '金口河区', '3', '511100', null, '1');
INSERT INTO AREA_INFO VALUES ('2147', '511123', '犍为县', '3', '511100', null, '1');
INSERT INTO AREA_INFO VALUES ('2148', '511124', '井研县', '3', '511100', null, '1');
INSERT INTO AREA_INFO VALUES ('2149', '511126', '夹江县', '3', '511100', null, '1');
INSERT INTO AREA_INFO VALUES ('2150', '511129', '沐川县', '3', '511100', null, '1');
INSERT INTO AREA_INFO VALUES ('2151', '511132', '峨边彝族自治县', '3', '511100', null, '1');
INSERT INTO AREA_INFO VALUES ('2152', '511133', '马边彝族自治县', '3', '511100', null, '1');
INSERT INTO AREA_INFO VALUES ('2153', '511181', '峨眉山市', '3', '511100', null, '1');
INSERT INTO AREA_INFO VALUES ('2154', '511300', '南充市', '2', '510000', null, '1');
INSERT INTO AREA_INFO VALUES ('2155', '511301', '市辖区', '3', '511300', null, '1');
INSERT INTO AREA_INFO VALUES ('2156', '511401', '市辖区', '3', '511400', null, '1');
INSERT INTO AREA_INFO VALUES ('2157', '511423', '洪雅县', '3', '511400', null, '1');
INSERT INTO AREA_INFO VALUES ('2158', '511424', '丹棱县', '3', '511400', null, '1');
INSERT INTO AREA_INFO VALUES ('2159', '511425', '青神县', '3', '511400', null, '1');
INSERT INTO AREA_INFO VALUES ('2160', '511500', '宜宾市', '2', '510000', null, '1');
INSERT INTO AREA_INFO VALUES ('2161', '511501', '市辖区', '3', '511500', null, '1');
INSERT INTO AREA_INFO VALUES ('2162', '511502', '翠屏区', '3', '511500', null, '1');
INSERT INTO AREA_INFO VALUES ('2163', '511521', '宜宾县', '3', '511500', null, '1');
INSERT INTO AREA_INFO VALUES ('2164', '511522', '南溪县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2165', '511523', '江安县', '3', '511500', null, '1');
INSERT INTO AREA_INFO VALUES ('2166', '511524', '长宁县', '3', '511500', null, '1');
INSERT INTO AREA_INFO VALUES ('2167', '511525', '高县', '3', '511500', null, '1');
INSERT INTO AREA_INFO VALUES ('2168', '511526', '珙县', '3', '511500', null, '1');
INSERT INTO AREA_INFO VALUES ('2169', '511527', '筠连县', '3', '511500', null, '1');
INSERT INTO AREA_INFO VALUES ('2170', '511528', '兴文县', '3', '511500', null, '1');
INSERT INTO AREA_INFO VALUES ('2171', '511623', '邻水县', '3', '511600', null, '1');
INSERT INTO AREA_INFO VALUES ('2172', '511681', '华蓥市', '3', '511600', null, '1');
INSERT INTO AREA_INFO VALUES ('2173', '511700', '达州市', '2', '510000', null, '1');
INSERT INTO AREA_INFO VALUES ('2174', '511701', '市辖区', '3', '511700', null, '1');
INSERT INTO AREA_INFO VALUES ('2175', '511702', '通川区', '3', '511700', null, '1');
INSERT INTO AREA_INFO VALUES ('2176', '511721', '达县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2177', '511722', '宣汉县', '3', '511700', null, '1');
INSERT INTO AREA_INFO VALUES ('2178', '511723', '开江县', '3', '511700', null, '1');
INSERT INTO AREA_INFO VALUES ('2179', '511724', '大竹县', '3', '511700', null, '1');
INSERT INTO AREA_INFO VALUES ('2180', '511725', '渠县', '3', '511700', null, '1');
INSERT INTO AREA_INFO VALUES ('2181', '511781', '万源市', '3', '511700', null, '1');
INSERT INTO AREA_INFO VALUES ('2182', '511800', '雅安市', '2', '510000', null, '1');
INSERT INTO AREA_INFO VALUES ('2183', '511801', '市辖区', '3', '511800', null, '1');
INSERT INTO AREA_INFO VALUES ('2184', '511802', '雨城区', '3', '511800', null, '1');
INSERT INTO AREA_INFO VALUES ('2185', '511821', '名山县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2186', '511822', '荥经县', '3', '511800', null, '1');
INSERT INTO AREA_INFO VALUES ('2187', '511823', '汉源县', '3', '511800', null, '1');
INSERT INTO AREA_INFO VALUES ('2188', '511824', '石棉县', '3', '511800', null, '1');
INSERT INTO AREA_INFO VALUES ('2189', '511825', '天全县', '3', '511800', null, '1');
INSERT INTO AREA_INFO VALUES ('2190', '511826', '芦山县', '3', '511800', null, '1');
INSERT INTO AREA_INFO VALUES ('2191', '511827', '宝兴县', '3', '511800', null, '1');
INSERT INTO AREA_INFO VALUES ('2192', '520101', '市辖区', '3', '520100', null, '1');
INSERT INTO AREA_INFO VALUES ('2193', '520102', '南明区', '3', '520100', null, '1');
INSERT INTO AREA_INFO VALUES ('2194', '520103', '云岩区', '3', '520100', null, '1');
INSERT INTO AREA_INFO VALUES ('2195', '520111', '花溪区', '3', '520100', null, '1');
INSERT INTO AREA_INFO VALUES ('2196', '520112', '乌当区', '3', '520100', null, '1');
INSERT INTO AREA_INFO VALUES ('2197', '520113', '白云区', '3', '520100', null, '1');
INSERT INTO AREA_INFO VALUES ('2198', '520114', '小河区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2199', '520121', '开阳县', '3', '520100', null, '1');
INSERT INTO AREA_INFO VALUES ('2200', '520122', '息烽县', '3', '520100', null, '1');
INSERT INTO AREA_INFO VALUES ('2201', '520123', '修文县', '3', '520100', null, '1');
INSERT INTO AREA_INFO VALUES ('2202', '520181', '清镇市', '3', '520100', null, '1');
INSERT INTO AREA_INFO VALUES ('2203', '520200', '六盘水市', '2', '520000', null, '1');
INSERT INTO AREA_INFO VALUES ('2204', '520201', '钟山区', '3', '520200', null, '1');
INSERT INTO AREA_INFO VALUES ('2205', '520221', '水城县', '3', '520200', null, '1');
INSERT INTO AREA_INFO VALUES ('2206', '520222', '盘县', '3', '520200', null, '1');
INSERT INTO AREA_INFO VALUES ('2207', '520300', '遵义市', '2', '520000', null, '1');
INSERT INTO AREA_INFO VALUES ('2208', '520301', '市辖区', '3', '520300', null, '1');
INSERT INTO AREA_INFO VALUES ('2209', '520302', '红花岗区', '3', '520300', null, '1');
INSERT INTO AREA_INFO VALUES ('2210', '520303', '汇川区', '3', '520300', null, '1');
INSERT INTO AREA_INFO VALUES ('2211', '520321', '遵义县', '3', '520300', null, '1');
INSERT INTO AREA_INFO VALUES ('2212', '520322', '桐梓县', '3', '520300', null, '1');
INSERT INTO AREA_INFO VALUES ('2213', '520323', '绥阳县', '3', '520300', null, '1');
INSERT INTO AREA_INFO VALUES ('2214', '520324', '正安县', '3', '520300', null, '1');
INSERT INTO AREA_INFO VALUES ('2215', '520325', '道真仡佬族苗族自治县', '3', '520300', null, '1');
INSERT INTO AREA_INFO VALUES ('2216', '520326', '务川仡佬族苗族自治县', '3', '520300', null, '1');
INSERT INTO AREA_INFO VALUES ('2217', '520327', '凤冈县', '3', '520300', null, '1');
INSERT INTO AREA_INFO VALUES ('2218', '520328', '湄潭县', '3', '520300', null, '1');
INSERT INTO AREA_INFO VALUES ('2219', '520329', '余庆县', '3', '520300', null, '1');
INSERT INTO AREA_INFO VALUES ('2220', '520330', '习水县', '3', '520300', null, '1');
INSERT INTO AREA_INFO VALUES ('2221', '520381', '赤水市', '3', '520300', null, '1');
INSERT INTO AREA_INFO VALUES ('2222', '520382', '仁怀市', '3', '520300', null, '1');
INSERT INTO AREA_INFO VALUES ('2223', '520400', '安顺市', '2', '520000', null, '1');
INSERT INTO AREA_INFO VALUES ('2224', '520401', '市辖区', '3', '520400', null, '1');
INSERT INTO AREA_INFO VALUES ('2225', '520402', '西秀区', '3', '520400', null, '1');
INSERT INTO AREA_INFO VALUES ('2226', '520421', '平坝县', '3', '520400', null, '1');
INSERT INTO AREA_INFO VALUES ('2227', '520422', '普定县', '3', '520400', null, '1');
INSERT INTO AREA_INFO VALUES ('2228', '520423', '镇宁布依族苗族自治县', '3', '520400', null, '1');
INSERT INTO AREA_INFO VALUES ('2229', '520424', '关岭布依族苗族自治县', '3', '520400', null, '1');
INSERT INTO AREA_INFO VALUES ('2230', '520425', '紫云苗族布依族自治县', '3', '520400', null, '1');
INSERT INTO AREA_INFO VALUES ('2231', '522200', '铜仁地区', '2', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2232', '522201', '铜仁市', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2233', '522222', '江口县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2234', '522223', '玉屏侗族自治县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2235', '522224', '石阡县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2236', '522225', '思南县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2237', '522428', '赫章县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2238', '522600', '黔东南苗族侗族自治州', '2', '520000', null, '1');
INSERT INTO AREA_INFO VALUES ('2239', '522601', '凯里市', '3', '522600', null, '1');
INSERT INTO AREA_INFO VALUES ('2240', '522622', '黄平县', '3', '522600', null, '1');
INSERT INTO AREA_INFO VALUES ('2241', '522623', '施秉县', '3', '522600', null, '1');
INSERT INTO AREA_INFO VALUES ('2242', '522624', '三穗县', '3', '522600', null, '1');
INSERT INTO AREA_INFO VALUES ('2243', '522625', '镇远县', '3', '522600', null, '1');
INSERT INTO AREA_INFO VALUES ('2244', '522626', '岑巩县', '3', '522600', null, '1');
INSERT INTO AREA_INFO VALUES ('2245', '522627', '天柱县', '3', '522600', null, '1');
INSERT INTO AREA_INFO VALUES ('2246', '522628', '锦屏县', '3', '522600', null, '1');
INSERT INTO AREA_INFO VALUES ('2247', '522629', '剑河县', '3', '522600', null, '1');
INSERT INTO AREA_INFO VALUES ('2248', '522630', '台江县', '3', '522600', null, '1');
INSERT INTO AREA_INFO VALUES ('2249', '522631', '黎平县', '3', '522600', null, '1');
INSERT INTO AREA_INFO VALUES ('2250', '522632', '榕江县', '3', '522600', null, '1');
INSERT INTO AREA_INFO VALUES ('2251', '522633', '从江县', '3', '522600', null, '1');
INSERT INTO AREA_INFO VALUES ('2252', '522634', '雷山县', '3', '522600', null, '1');
INSERT INTO AREA_INFO VALUES ('2253', '522635', '麻江县', '3', '522600', null, '1');
INSERT INTO AREA_INFO VALUES ('2254', '522636', '丹寨县', '3', '522600', null, '1');
INSERT INTO AREA_INFO VALUES ('2255', '522700', '黔南布依族苗族自治州', '2', '520000', null, '1');
INSERT INTO AREA_INFO VALUES ('2256', '522701', '都匀市', '3', '522700', null, '1');
INSERT INTO AREA_INFO VALUES ('2257', '530426', '峨山彝族自治县', '3', '530400', null, '1');
INSERT INTO AREA_INFO VALUES ('2258', '530427', '新平彝族傣族自治县', '3', '530400', null, '1');
INSERT INTO AREA_INFO VALUES ('2259', '530500', '保山市', '2', '530000', null, '1');
INSERT INTO AREA_INFO VALUES ('2260', '530501', '市辖区', '3', '530500', null, '1');
INSERT INTO AREA_INFO VALUES ('2261', '530502', '隆阳区', '3', '530500', null, '1');
INSERT INTO AREA_INFO VALUES ('2262', '530521', '施甸县', '3', '530500', null, '1');
INSERT INTO AREA_INFO VALUES ('2263', '530522', '腾冲县', '3', '530500', null, '1');
INSERT INTO AREA_INFO VALUES ('2264', '530523', '龙陵县', '3', '530500', null, '1');
INSERT INTO AREA_INFO VALUES ('2265', '530524', '昌宁县', '3', '530500', null, '1');
INSERT INTO AREA_INFO VALUES ('2266', '530600', '昭通市', '2', '530000', null, '1');
INSERT INTO AREA_INFO VALUES ('2267', '530601', '市辖区', '3', '530600', null, '1');
INSERT INTO AREA_INFO VALUES ('2268', '530602', '昭阳区', '3', '530600', null, '1');
INSERT INTO AREA_INFO VALUES ('2269', '530621', '鲁甸县', '3', '530600', null, '1');
INSERT INTO AREA_INFO VALUES ('2270', '530622', '巧家县', '3', '530600', null, '1');
INSERT INTO AREA_INFO VALUES ('2271', '530623', '盐津县', '3', '530600', null, '1');
INSERT INTO AREA_INFO VALUES ('2272', '530624', '大关县', '3', '530600', null, '1');
INSERT INTO AREA_INFO VALUES ('2273', '530625', '永善县', '3', '530600', null, '1');
INSERT INTO AREA_INFO VALUES ('2274', '530626', '绥江县', '3', '530600', null, '1');
INSERT INTO AREA_INFO VALUES ('2275', '530627', '镇雄县', '3', '530600', null, '1');
INSERT INTO AREA_INFO VALUES ('2276', '530628', '彝良县', '3', '530600', null, '1');
INSERT INTO AREA_INFO VALUES ('2277', '530629', '威信县', '3', '530600', null, '1');
INSERT INTO AREA_INFO VALUES ('2278', '340802', '迎江区', '3', '340800', null, '1');
INSERT INTO AREA_INFO VALUES ('2279', '340803', '大观区', '3', '340800', null, '1');
INSERT INTO AREA_INFO VALUES ('2280', '340823', '枞阳县', '3', '340800', null, '1');
INSERT INTO AREA_INFO VALUES ('2281', '340824', '潜山县', '3', '340800', null, '1');
INSERT INTO AREA_INFO VALUES ('2282', '340825', '太湖县', '3', '340800', null, '1');
INSERT INTO AREA_INFO VALUES ('2283', '340826', '宿松县', '3', '340800', null, '1');
INSERT INTO AREA_INFO VALUES ('2284', '341181', '天长市', '3', '341100', null, '1');
INSERT INTO AREA_INFO VALUES ('2285', '341182', '明光市', '3', '341100', null, '1');
INSERT INTO AREA_INFO VALUES ('2286', '341200', '阜阳市', '2', '340000', null, '1');
INSERT INTO AREA_INFO VALUES ('2287', '341201', '市辖区', '3', '341200', null, '1');
INSERT INTO AREA_INFO VALUES ('2288', '341202', '颍州区', '3', '341200', null, '1');
INSERT INTO AREA_INFO VALUES ('2289', '341203', '颍东区', '3', '341200', null, '1');
INSERT INTO AREA_INFO VALUES ('2290', '341204', '颍泉区', '3', '341200', null, '1');
INSERT INTO AREA_INFO VALUES ('2291', '341221', '临泉县', '3', '341200', null, '1');
INSERT INTO AREA_INFO VALUES ('2292', '341222', '太和县', '3', '341200', null, '1');
INSERT INTO AREA_INFO VALUES ('2293', '341225', '阜南县', '3', '341200', null, '1');
INSERT INTO AREA_INFO VALUES ('2294', '341226', '颍上县', '3', '341200', null, '1');
INSERT INTO AREA_INFO VALUES ('2295', '341282', '界首市', '3', '341200', null, '1');
INSERT INTO AREA_INFO VALUES ('2296', '341300', '宿州市', '2', '340000', null, '1');
INSERT INTO AREA_INFO VALUES ('2297', '341301', '市辖区', '3', '341300', null, '1');
INSERT INTO AREA_INFO VALUES ('2298', '341302', '埇桥区', '3', '341300', null, '1');
INSERT INTO AREA_INFO VALUES ('2299', '341321', '砀山县', '3', '341300', null, '1');
INSERT INTO AREA_INFO VALUES ('2300', '341322', '萧县', '3', '341300', null, '1');
INSERT INTO AREA_INFO VALUES ('2301', '341323', '灵璧县', '3', '341300', null, '1');
INSERT INTO AREA_INFO VALUES ('2302', '341324', '泗县', '3', '341300', null, '1');
INSERT INTO AREA_INFO VALUES ('2303', '341400', '巢湖市', '2', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2304', '341401', '市辖区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2305', '341402', '居巢区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2306', '341421', '庐江县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2307', '341422', '无为县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2308', '341423', '含山县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2309', '341424', '和县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2310', '341500', '六安市', '2', '340000', null, '1');
INSERT INTO AREA_INFO VALUES ('2311', '341501', '市辖区', '3', '341500', null, '1');
INSERT INTO AREA_INFO VALUES ('2312', '341502', '金安区', '3', '341500', null, '1');
INSERT INTO AREA_INFO VALUES ('2313', '341503', '裕安区', '3', '341500', null, '1');
INSERT INTO AREA_INFO VALUES ('2314', '341521', '寿县', '3', '341500', null, '1');
INSERT INTO AREA_INFO VALUES ('2315', '341522', '霍邱县', '3', '341500', null, '1');
INSERT INTO AREA_INFO VALUES ('2316', '341523', '舒城县', '3', '341500', null, '1');
INSERT INTO AREA_INFO VALUES ('2317', '341524', '金寨县', '3', '341500', null, '1');
INSERT INTO AREA_INFO VALUES ('2318', '341525', '霍山县', '3', '341500', null, '1');
INSERT INTO AREA_INFO VALUES ('2319', '341600', '亳州市', '2', '340000', null, '1');
INSERT INTO AREA_INFO VALUES ('2320', '341601', '市辖区', '3', '341600', null, '1');
INSERT INTO AREA_INFO VALUES ('2321', '341602', '谯城区', '3', '341600', null, '1');
INSERT INTO AREA_INFO VALUES ('2322', '341621', '涡阳县', '3', '341600', null, '1');
INSERT INTO AREA_INFO VALUES ('2323', '341721', '东至县', '3', '341700', null, '1');
INSERT INTO AREA_INFO VALUES ('2324', '341722', '石台县', '3', '341700', null, '1');
INSERT INTO AREA_INFO VALUES ('2325', '341723', '青阳县', '3', '341700', null, '1');
INSERT INTO AREA_INFO VALUES ('2326', '341800', '宣城市', '2', '340000', null, '1');
INSERT INTO AREA_INFO VALUES ('2327', '341801', '市辖区', '3', '341800', null, '1');
INSERT INTO AREA_INFO VALUES ('2328', '341802', '宣州区', '3', '341800', null, '1');
INSERT INTO AREA_INFO VALUES ('2329', '341821', '郎溪县', '3', '341800', null, '1');
INSERT INTO AREA_INFO VALUES ('2330', '341822', '广德县', '3', '341800', null, '1');
INSERT INTO AREA_INFO VALUES ('2331', '341823', '泾县', '3', '341800', null, '1');
INSERT INTO AREA_INFO VALUES ('2332', '341824', '绩溪县', '3', '341800', null, '1');
INSERT INTO AREA_INFO VALUES ('2333', '341825', '旌德县', '3', '341800', null, '1');
INSERT INTO AREA_INFO VALUES ('2334', '341881', '宁国市', '3', '341800', null, '1');
INSERT INTO AREA_INFO VALUES ('2335', '350000', '福建省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('2336', '350100', '福州市', '2', '350000', null, '1');
INSERT INTO AREA_INFO VALUES ('2337', '350101', '市辖区', '3', '350100', null, '1');
INSERT INTO AREA_INFO VALUES ('2338', '350102', '鼓楼区', '3', '350100', null, '1');
INSERT INTO AREA_INFO VALUES ('2339', '350103', '台江区', '3', '350100', null, '1');
INSERT INTO AREA_INFO VALUES ('2340', '350104', '仓山区', '3', '350100', null, '1');
INSERT INTO AREA_INFO VALUES ('2341', '350105', '马尾区', '3', '350100', null, '1');
INSERT INTO AREA_INFO VALUES ('2342', '350111', '晋安区', '3', '350100', null, '1');
INSERT INTO AREA_INFO VALUES ('2343', '350123', '罗源县', '3', '350100', null, '1');
INSERT INTO AREA_INFO VALUES ('2344', '350124', '闽清县', '3', '350100', null, '1');
INSERT INTO AREA_INFO VALUES ('2345', '350125', '永泰县', '3', '350100', null, '1');
INSERT INTO AREA_INFO VALUES ('2346', '350128', '平潭县', '3', '350100', null, '1');
INSERT INTO AREA_INFO VALUES ('2347', '350181', '福清市', '3', '350100', null, '1');
INSERT INTO AREA_INFO VALUES ('2348', '350182', '长乐市', '3', '350100', null, '1');
INSERT INTO AREA_INFO VALUES ('2349', '350200', '厦门市', '2', '350000', null, '1');
INSERT INTO AREA_INFO VALUES ('2350', '350303', '涵江区', '3', '350300', null, '1');
INSERT INTO AREA_INFO VALUES ('2351', '350304', '荔城区', '3', '350300', null, '1');
INSERT INTO AREA_INFO VALUES ('2352', '350305', '秀屿区', '3', '350300', null, '1');
INSERT INTO AREA_INFO VALUES ('2353', '350322', '仙游县', '3', '350300', null, '1');
INSERT INTO AREA_INFO VALUES ('2354', '350400', '三明市', '2', '350000', null, '1');
INSERT INTO AREA_INFO VALUES ('2355', '350601', '市辖区', '3', '350600', null, '1');
INSERT INTO AREA_INFO VALUES ('2356', '350602', '芗城区', '3', '350600', null, '1');
INSERT INTO AREA_INFO VALUES ('2357', '350603', '龙文区', '3', '350600', null, '1');
INSERT INTO AREA_INFO VALUES ('2358', '350622', '云霄县', '3', '350600', null, '1');
INSERT INTO AREA_INFO VALUES ('2359', '350623', '漳浦县', '3', '350600', null, '1');
INSERT INTO AREA_INFO VALUES ('2360', '350624', '诏安县', '3', '350600', null, '1');
INSERT INTO AREA_INFO VALUES ('2361', '350625', '长泰县', '3', '350600', null, '1');
INSERT INTO AREA_INFO VALUES ('2362', '350626', '东山县', '3', '350600', null, '1');
INSERT INTO AREA_INFO VALUES ('2363', '350627', '南靖县', '3', '350600', null, '1');
INSERT INTO AREA_INFO VALUES ('3252', '513428', '普格县', '3', '513400', null, '1');
INSERT INTO AREA_INFO VALUES ('3253', '513429', '布拖县', '3', '513400', null, '1');
INSERT INTO AREA_INFO VALUES ('3254', '513430', '金阳县', '3', '513400', null, '1');
INSERT INTO AREA_INFO VALUES ('3255', '513431', '昭觉县', '3', '513400', null, '1');
INSERT INTO AREA_INFO VALUES ('3256', '513432', '喜德县', '3', '513400', null, '1');
INSERT INTO AREA_INFO VALUES ('3257', '513433', '冕宁县', '3', '513400', null, '1');
INSERT INTO AREA_INFO VALUES ('3258', '513434', '越西县', '3', '513400', null, '1');
INSERT INTO AREA_INFO VALUES ('3259', '513435', '甘洛县', '3', '513400', null, '1');
INSERT INTO AREA_INFO VALUES ('3260', '513436', '美姑县', '3', '513400', null, '1');
INSERT INTO AREA_INFO VALUES ('3261', '513437', '雷波县', '3', '513400', null, '1');
INSERT INTO AREA_INFO VALUES ('3262', '520000', '贵州省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('3263', '520100', '贵阳市', '2', '520000', null, '1');
INSERT INTO AREA_INFO VALUES ('3264', '520203', '六枝特区', '3', '520200', null, '1');
INSERT INTO AREA_INFO VALUES ('3265', '522226', '印江土家族苗族自治县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3266', '522227', '德江县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3267', '522228', '沿河土家族自治县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3268', '522229', '松桃苗族自治县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3269', '522230', '万山特区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3270', '522301', '兴义市', '3', '522300', null, '1');
INSERT INTO AREA_INFO VALUES ('3271', '522322', '兴仁县', '3', '522300', null, '1');
INSERT INTO AREA_INFO VALUES ('3272', '522323', '普安县', '3', '522300', null, '1');
INSERT INTO AREA_INFO VALUES ('3273', '522324', '晴隆县', '3', '522300', null, '1');
INSERT INTO AREA_INFO VALUES ('3274', '522325', '贞丰县', '3', '522300', null, '1');
INSERT INTO AREA_INFO VALUES ('3275', '522326', '望谟县', '3', '522300', null, '1');
INSERT INTO AREA_INFO VALUES ('3276', '522327', '册亨县', '3', '522300', null, '1');
INSERT INTO AREA_INFO VALUES ('3277', '522328', '安龙县', '3', '522300', null, '1');
INSERT INTO AREA_INFO VALUES ('3278', '522400', '毕节地区', '2', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3279', '522401', '毕节市', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3280', '522422', '大方县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3281', '522423', '黔西县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3282', '370213', '李沧区', '3', '370200', null, '1');
INSERT INTO AREA_INFO VALUES ('3283', '370214', '城阳区', '3', '370200', null, '1');
INSERT INTO AREA_INFO VALUES ('3284', '370281', '胶州市', '3', '370200', null, '1');
INSERT INTO AREA_INFO VALUES ('3285', '370282', '即墨市', '3', '370200', null, '1');
INSERT INTO AREA_INFO VALUES ('3286', '370283', '平度市', '3', '370200', null, '1');
INSERT INTO AREA_INFO VALUES ('3287', '370322', '高青县', '3', '370300', null, '1');
INSERT INTO AREA_INFO VALUES ('3288', '370323', '沂源县', '3', '370300', null, '1');
INSERT INTO AREA_INFO VALUES ('3289', '370400', '枣庄市', '2', '370000', null, '1');
INSERT INTO AREA_INFO VALUES ('3290', '370401', '市辖区', '3', '370400', null, '1');
INSERT INTO AREA_INFO VALUES ('3291', '370402', '市中区', '3', '370400', null, '1');
INSERT INTO AREA_INFO VALUES ('3292', '370403', '薛城区', '3', '370400', null, '1');
INSERT INTO AREA_INFO VALUES ('3293', '370404', '峄城区', '3', '370400', null, '1');
INSERT INTO AREA_INFO VALUES ('3294', '370405', '台儿庄区', '3', '370400', null, '1');
INSERT INTO AREA_INFO VALUES ('3295', '440604', '禅城区', '3', '440600', null, '1');
INSERT INTO AREA_INFO VALUES ('3296', '440605', '南海区', '3', '440600', null, '1');
INSERT INTO AREA_INFO VALUES ('3297', '440606', '顺德区', '3', '440600', null, '1');
INSERT INTO AREA_INFO VALUES ('3298', '440607', '三水区', '3', '440600', null, '1');
INSERT INTO AREA_INFO VALUES ('3299', '440608', '高明区', '3', '440600', null, '1');
INSERT INTO AREA_INFO VALUES ('3300', '440700', '江门市', '2', '440000', null, '1');
INSERT INTO AREA_INFO VALUES ('3301', '440701', '市辖区', '3', '440700', null, '1');
INSERT INTO AREA_INFO VALUES ('3302', '440703', '蓬江区', '3', '440700', null, '1');
INSERT INTO AREA_INFO VALUES ('3303', '440704', '江海区', '3', '440700', null, '1');
INSERT INTO AREA_INFO VALUES ('3304', '440301', '市辖区', '3', '440300', null, '1');
INSERT INTO AREA_INFO VALUES ('3305', '440303', '罗湖区', '3', '440300', null, '1');
INSERT INTO AREA_INFO VALUES ('3306', '451202', '金城江区', '3', '451200', null, '1');
INSERT INTO AREA_INFO VALUES ('3307', '451302', '兴宾区', '3', '451300', null, '1');
INSERT INTO AREA_INFO VALUES ('3308', '451321', '忻城县', '3', '451300', null, '1');
INSERT INTO AREA_INFO VALUES ('3309', '451322', '象州县', '3', '451300', null, '1');
INSERT INTO AREA_INFO VALUES ('3310', '451323', '武宣县', '3', '451300', null, '1');
INSERT INTO AREA_INFO VALUES ('3311', '451324', '金秀瑶族自治县', '3', '451300', null, '1');
INSERT INTO AREA_INFO VALUES ('3312', '451381', '合山市', '3', '451300', null, '1');
INSERT INTO AREA_INFO VALUES ('3313', '451400', '崇左市', '2', '450000', null, '1');
INSERT INTO AREA_INFO VALUES ('3314', '451401', '市辖区', '3', '451400', null, '1');
INSERT INTO AREA_INFO VALUES ('3315', '451402', '江洲区', '3', '451400', null, '1');
INSERT INTO AREA_INFO VALUES ('3316', '451421', '扶绥县', '3', '451400', null, '1');
INSERT INTO AREA_INFO VALUES ('3317', '451422', '宁明县', '3', '451400', null, '1');
INSERT INTO AREA_INFO VALUES ('3318', '451423', '龙州县', '3', '451400', null, '1');
INSERT INTO AREA_INFO VALUES ('3319', '451424', '大新县', '3', '451400', null, '1');
INSERT INTO AREA_INFO VALUES ('3320', '451425', '天等县', '3', '451400', null, '1');
INSERT INTO AREA_INFO VALUES ('3321', '451481', '凭祥市', '3', '451400', null, '1');
INSERT INTO AREA_INFO VALUES ('3322', '540000', '西藏自治区', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('3323', '540100', '拉萨市', '2', '540000', null, '1');
INSERT INTO AREA_INFO VALUES ('3324', '542229', '加查县', '3', '542200', null, '1');
INSERT INTO AREA_INFO VALUES ('3325', '542231', '隆子县', '3', '542200', null, '1');
INSERT INTO AREA_INFO VALUES ('3326', '542232', '错那县', '3', '542200', null, '1');
INSERT INTO AREA_INFO VALUES ('3327', '542233', '浪卡子县', '3', '542200', null, '1');
INSERT INTO AREA_INFO VALUES ('3328', '542300', '日喀则地区', '2', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3329', '542301', '日喀则市', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3330', '542322', '南木林县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3331', '542323', '江孜县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3332', '542324', '定日县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3333', '542421', '那曲县', '3', '542400', null, '1');
INSERT INTO AREA_INFO VALUES ('3334', '542422', '嘉黎县', '3', '542400', null, '1');
INSERT INTO AREA_INFO VALUES ('3335', '542423', '比如县', '3', '542400', null, '1');
INSERT INTO AREA_INFO VALUES ('3336', '542424', '聂荣县', '3', '542400', null, '1');
INSERT INTO AREA_INFO VALUES ('3337', '542425', '安多县', '3', '542400', null, '1');
INSERT INTO AREA_INFO VALUES ('3338', '542430', '尼玛县', '3', '542400', null, '1');
INSERT INTO AREA_INFO VALUES ('3339', '542500', '阿里地区', '2', '540000', null, '1');
INSERT INTO AREA_INFO VALUES ('3340', '542521', '普兰县', '3', '542500', null, '1');
INSERT INTO AREA_INFO VALUES ('3341', '542522', '札达县', '3', '542500', null, '1');
INSERT INTO AREA_INFO VALUES ('3342', '542523', '噶尔县', '3', '542500', null, '1');
INSERT INTO AREA_INFO VALUES ('3343', '542524', '日土县', '3', '542500', null, '1');
INSERT INTO AREA_INFO VALUES ('3344', '610328', '千阳县', '3', '610300', null, '1');
INSERT INTO AREA_INFO VALUES ('3345', '610329', '麟游县', '3', '610300', null, '1');
INSERT INTO AREA_INFO VALUES ('3346', '610428', '长武县', '3', '610400', null, '1');
INSERT INTO AREA_INFO VALUES ('3347', '610429', '旬邑县', '3', '610400', null, '1');
INSERT INTO AREA_INFO VALUES ('3348', '610430', '淳化县', '3', '610400', null, '1');
INSERT INTO AREA_INFO VALUES ('3349', '610431', '武功县', '3', '610400', null, '1');
INSERT INTO AREA_INFO VALUES ('3350', '610481', '兴平市', '3', '610400', null, '1');
INSERT INTO AREA_INFO VALUES ('3351', '610500', '渭南市', '2', '610000', null, '1');
INSERT INTO AREA_INFO VALUES ('3352', '610501', '市辖区', '3', '610500', null, '1');
INSERT INTO AREA_INFO VALUES ('3353', '610502', '临渭区', '3', '610500', null, '1');
INSERT INTO AREA_INFO VALUES ('3354', '610521', '华县', '3', '610500', null, '1');
INSERT INTO AREA_INFO VALUES ('3355', '610522', '潼关县', '3', '610500', null, '1');
INSERT INTO AREA_INFO VALUES ('3356', '610523', '大荔县', '3', '610500', null, '1');
INSERT INTO AREA_INFO VALUES ('3357', '610524', '合阳县', '3', '610500', null, '1');
INSERT INTO AREA_INFO VALUES ('3358', '610525', '澄城县', '3', '610500', null, '1');
INSERT INTO AREA_INFO VALUES ('3359', '610526', '蒲城县', '3', '610500', null, '1');
INSERT INTO AREA_INFO VALUES ('3360', '610527', '白水县', '3', '610500', null, '1');
INSERT INTO AREA_INFO VALUES ('3361', '611021', '洛南县', '3', '611000', null, '1');
INSERT INTO AREA_INFO VALUES ('3362', '611022', '丹凤县', '3', '611000', null, '1');
INSERT INTO AREA_INFO VALUES ('3363', '611023', '商南县', '3', '611000', null, '1');
INSERT INTO AREA_INFO VALUES ('3364', '611024', '山阳县', '3', '611000', null, '1');
INSERT INTO AREA_INFO VALUES ('3365', '611025', '镇安县', '3', '611000', null, '1');
INSERT INTO AREA_INFO VALUES ('3366', '611026', '柞水县', '3', '611000', null, '1');
INSERT INTO AREA_INFO VALUES ('3367', '620000', '甘肃省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('3368', '620100', '兰州市', '2', '620000', null, '1');
INSERT INTO AREA_INFO VALUES ('3369', '620101', '市辖区', '3', '620100', null, '1');
INSERT INTO AREA_INFO VALUES ('3370', '620102', '城关区', '3', '620100', null, '1');
INSERT INTO AREA_INFO VALUES ('3371', '620103', '七里河区', '3', '620100', null, '1');
INSERT INTO AREA_INFO VALUES ('3372', '620422', '会宁县', '3', '620400', null, '1');
INSERT INTO AREA_INFO VALUES ('3373', '620423', '景泰县', '3', '620400', null, '1');
INSERT INTO AREA_INFO VALUES ('3374', '620500', '天水市', '2', '620000', null, '1');
INSERT INTO AREA_INFO VALUES ('3375', '620501', '市辖区', '3', '620500', null, '1');
INSERT INTO AREA_INFO VALUES ('3376', '620502', '秦城区', '3', '620500', null, '1');
INSERT INTO AREA_INFO VALUES ('3377', '620503', '北道区', '3', '620500', null, '1');
INSERT INTO AREA_INFO VALUES ('3378', '620521', '清水县', '3', '620500', null, '1');
INSERT INTO AREA_INFO VALUES ('3379', '620522', '秦安县', '3', '620500', null, '1');
INSERT INTO AREA_INFO VALUES ('3380', '620523', '甘谷县', '3', '620500', null, '1');
INSERT INTO AREA_INFO VALUES ('3381', '620524', '武山县', '3', '620500', null, '1');
INSERT INTO AREA_INFO VALUES ('3382', '620525', '张家川回族自治县', '3', '620500', null, '1');
INSERT INTO AREA_INFO VALUES ('3383', '620600', '武威市', '2', '620000', null, '1');
INSERT INTO AREA_INFO VALUES ('3384', '620601', '市辖区', '3', '620600', null, '1');
INSERT INTO AREA_INFO VALUES ('3385', '620602', '凉州区', '3', '620600', null, '1');
INSERT INTO AREA_INFO VALUES ('3386', '620621', '民勤县', '3', '620600', null, '1');
INSERT INTO AREA_INFO VALUES ('3387', '620622', '古浪县', '3', '620600', null, '1');
INSERT INTO AREA_INFO VALUES ('3388', '620623', '天祝藏族自治县', '3', '620600', null, '1');
INSERT INTO AREA_INFO VALUES ('3389', '620700', '张掖市', '2', '620000', null, '1');
INSERT INTO AREA_INFO VALUES ('3390', '620701', '市辖区', '3', '620700', null, '1');
INSERT INTO AREA_INFO VALUES ('3391', '620801', '市辖区', '3', '620800', null, '1');
INSERT INTO AREA_INFO VALUES ('3392', '620981', '玉门市', '3', '620900', null, '1');
INSERT INTO AREA_INFO VALUES ('3393', '620982', '敦煌市', '3', '620900', null, '1');
INSERT INTO AREA_INFO VALUES ('3394', '621000', '庆阳市', '2', '620000', null, '1');
INSERT INTO AREA_INFO VALUES ('3395', '621001', '市辖区', '3', '621000', null, '1');
INSERT INTO AREA_INFO VALUES ('3396', '621002', '西峰区', '3', '621000', null, '1');
INSERT INTO AREA_INFO VALUES ('3397', '621021', '庆城县', '3', '621000', null, '1');
INSERT INTO AREA_INFO VALUES ('3398', '621022', '环县', '3', '621000', null, '1');
INSERT INTO AREA_INFO VALUES ('3399', '621023', '华池县', '3', '621000', null, '1');
INSERT INTO AREA_INFO VALUES ('3400', '621024', '合水县', '3', '621000', null, '1');
INSERT INTO AREA_INFO VALUES ('3401', '621025', '正宁县', '3', '621000', null, '1');
INSERT INTO AREA_INFO VALUES ('3402', '621026', '宁县', '3', '621000', null, '1');
INSERT INTO AREA_INFO VALUES ('3403', '621027', '镇原县', '3', '621000', null, '1');
INSERT INTO AREA_INFO VALUES ('3404', '621100', '定西市', '2', '620000', null, '1');
INSERT INTO AREA_INFO VALUES ('3405', '621101', '市辖区', '3', '621100', null, '1');
INSERT INTO AREA_INFO VALUES ('3406', '621102', '安定区', '3', '621100', null, '1');
INSERT INTO AREA_INFO VALUES ('3407', '621121', '通渭县', '3', '621100', null, '1');
INSERT INTO AREA_INFO VALUES ('3408', '621202', '武都区', '3', '621200', null, '1');
INSERT INTO AREA_INFO VALUES ('3409', '621221', '成县', '3', '621200', null, '1');
INSERT INTO AREA_INFO VALUES ('3410', '621228', '两当县', '3', '621200', null, '1');
INSERT INTO AREA_INFO VALUES ('3411', '622900', '临夏回族自治州', '2', '620000', null, '1');
INSERT INTO AREA_INFO VALUES ('3412', '622901', '临夏市', '3', '622900', null, '1');
INSERT INTO AREA_INFO VALUES ('3413', '622921', '临夏县', '3', '622900', null, '1');
INSERT INTO AREA_INFO VALUES ('3414', '622922', '康乐县', '3', '622900', null, '1');
INSERT INTO AREA_INFO VALUES ('3415', '622923', '永靖县', '3', '622900', null, '1');
INSERT INTO AREA_INFO VALUES ('3416', '622924', '广河县', '3', '622900', null, '1');
INSERT INTO AREA_INFO VALUES ('3417', '622925', '和政县', '3', '622900', null, '1');
INSERT INTO AREA_INFO VALUES ('3418', '622926', '东乡族自治县', '3', '622900', null, '1');
INSERT INTO AREA_INFO VALUES ('3419', '623000', '甘南藏族自治州', '2', '620000', null, '1');
INSERT INTO AREA_INFO VALUES ('3420', '623001', '合作市', '3', '623000', null, '1');
INSERT INTO AREA_INFO VALUES ('3421', '630102', '城东区', '3', '630100', null, '1');
INSERT INTO AREA_INFO VALUES ('3422', '630103', '城中区', '3', '630100', null, '1');
INSERT INTO AREA_INFO VALUES ('3423', '630104', '城西区', '3', '630100', null, '1');
INSERT INTO AREA_INFO VALUES ('3424', '630105', '城北区', '3', '630100', null, '1');
INSERT INTO AREA_INFO VALUES ('3425', '630121', '大通回族土族自治县', '3', '630100', null, '1');
INSERT INTO AREA_INFO VALUES ('3426', '630122', '湟中县', '3', '630100', null, '1');
INSERT INTO AREA_INFO VALUES ('3427', '630123', '湟源县', '3', '630100', null, '1');
INSERT INTO AREA_INFO VALUES ('3428', '632122', '民和回族土族自治县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3429', '632123', '乐都县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3430', '632126', '互助土族自治县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3431', '632127', '化隆回族自治县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3432', '632128', '循化撒拉族自治县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3433', '632200', '海北藏族自治州', '2', '630000', null, '1');
INSERT INTO AREA_INFO VALUES ('3434', '632221', '门源回族自治县', '3', '632200', null, '1');
INSERT INTO AREA_INFO VALUES ('3435', '632222', '祁连县', '3', '632200', null, '1');
INSERT INTO AREA_INFO VALUES ('3436', '632223', '海晏县', '3', '632200', null, '1');
INSERT INTO AREA_INFO VALUES ('3437', '632224', '刚察县', '3', '632200', null, '1');
INSERT INTO AREA_INFO VALUES ('3438', '632300', '黄南藏族自治州', '2', '630000', null, '1');
INSERT INTO AREA_INFO VALUES ('3439', '632321', '同仁县', '3', '632300', null, '1');
INSERT INTO AREA_INFO VALUES ('3440', '632322', '尖扎县', '3', '632300', null, '1');
INSERT INTO AREA_INFO VALUES ('3441', '632323', '泽库县', '3', '632300', null, '1');
INSERT INTO AREA_INFO VALUES ('3442', '632324', '河南蒙古族自治县', '3', '632300', null, '1');
INSERT INTO AREA_INFO VALUES ('3443', '632500', '海南藏族自治州', '2', '630000', null, '1');
INSERT INTO AREA_INFO VALUES ('3444', '632521', '共和县', '3', '632500', null, '1');
INSERT INTO AREA_INFO VALUES ('3445', '632522', '同德县', '3', '632500', null, '1');
INSERT INTO AREA_INFO VALUES ('3446', '632523', '贵德县', '3', '632500', null, '1');
INSERT INTO AREA_INFO VALUES ('3447', '632524', '兴海县', '3', '632500', null, '1');
INSERT INTO AREA_INFO VALUES ('3448', '632525', '贵南县', '3', '632500', null, '1');
INSERT INTO AREA_INFO VALUES ('3449', '632621', '玛沁县', '3', '632600', null, '1');
INSERT INTO AREA_INFO VALUES ('3450', '632622', '班玛县', '3', '632600', null, '1');
INSERT INTO AREA_INFO VALUES ('3451', '632623', '甘德县', '3', '632600', null, '1');
INSERT INTO AREA_INFO VALUES ('3452', '632624', '达日县', '3', '632600', null, '1');
INSERT INTO AREA_INFO VALUES ('3453', '632625', '久治县', '3', '632600', null, '1');
INSERT INTO AREA_INFO VALUES ('3454', '632626', '玛多县', '3', '632600', null, '1');
INSERT INTO AREA_INFO VALUES ('3455', '632700', '玉树藏族自治州', '2', '630000', null, '1');
INSERT INTO AREA_INFO VALUES ('3456', '632721', '玉树县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3457', '632722', '杂多县', '3', '632700', null, '1');
INSERT INTO AREA_INFO VALUES ('3458', '632723', '称多县', '3', '632700', null, '1');
INSERT INTO AREA_INFO VALUES ('3459', '632726', '曲麻莱县', '3', '632700', null, '1');
INSERT INTO AREA_INFO VALUES ('3460', '632800', '海西蒙古族藏族自治州', '2', '630000', null, '1');
INSERT INTO AREA_INFO VALUES ('3461', '632801', '格尔木市', '3', '632800', null, '1');
INSERT INTO AREA_INFO VALUES ('3462', '632802', '德令哈市', '3', '632800', null, '1');
INSERT INTO AREA_INFO VALUES ('3463', '632821', '乌兰县', '3', '632800', null, '1');
INSERT INTO AREA_INFO VALUES ('3464', '632822', '都兰县', '3', '632800', null, '1');
INSERT INTO AREA_INFO VALUES ('3465', '632823', '天峻县', '3', '632800', null, '1');
INSERT INTO AREA_INFO VALUES ('3466', '632824', '芒崖', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3467', '632825', '冷湖', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3468', '632826', '大柴旦', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3469', '640000', '宁夏回族自治区', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('3470', '640100', '银川市', '2', '640000', null, '1');
INSERT INTO AREA_INFO VALUES ('3471', '640101', '市辖区', '3', '640100', null, '1');
INSERT INTO AREA_INFO VALUES ('3472', '640104', '兴庆区', '3', '640100', null, '1');
INSERT INTO AREA_INFO VALUES ('3473', '640105', '西夏区', '3', '640100', null, '1');
INSERT INTO AREA_INFO VALUES ('3474', '640106', '金凤区', '3', '640100', null, '1');
INSERT INTO AREA_INFO VALUES ('3475', '640121', '永宁县', '3', '640100', null, '1');
INSERT INTO AREA_INFO VALUES ('3476', '640122', '贺兰县', '3', '640100', null, '1');
INSERT INTO AREA_INFO VALUES ('3477', '640181', '灵武市', '3', '640100', null, '1');
INSERT INTO AREA_INFO VALUES ('3478', '640200', '石嘴山市', '2', '640000', null, '1');
INSERT INTO AREA_INFO VALUES ('3479', '640201', '市辖区', '3', '640200', null, '1');
INSERT INTO AREA_INFO VALUES ('3480', '640202', '大武口区', '3', '640200', null, '1');
INSERT INTO AREA_INFO VALUES ('3481', '640205', '惠农区', '3', '640200', null, '1');
INSERT INTO AREA_INFO VALUES ('3482', '640221', '平罗县', '3', '640200', null, '1');
INSERT INTO AREA_INFO VALUES ('3483', '640300', '吴忠市', '2', '640000', null, '1');
INSERT INTO AREA_INFO VALUES ('3484', '640301', '市辖区', '3', '640300', null, '1');
INSERT INTO AREA_INFO VALUES ('3485', '640302', '利通区', '3', '640300', null, '1');
INSERT INTO AREA_INFO VALUES ('3486', '640323', '盐池县', '3', '640300', null, '1');
INSERT INTO AREA_INFO VALUES ('3487', '640324', '同心县', '3', '640300', null, '1');
INSERT INTO AREA_INFO VALUES ('3488', '640381', '青铜峡市', '3', '640300', null, '1');
INSERT INTO AREA_INFO VALUES ('3489', '640400', '固原市', '2', '640000', null, '1');
INSERT INTO AREA_INFO VALUES ('3490', '640401', '市辖区', '3', '640400', null, '1');
INSERT INTO AREA_INFO VALUES ('3491', '640402', '原州区', '3', '640400', null, '1');
INSERT INTO AREA_INFO VALUES ('3492', '640422', '西吉县', '3', '640400', null, '1');
INSERT INTO AREA_INFO VALUES ('3493', '640423', '隆德县', '3', '640400', null, '1');
INSERT INTO AREA_INFO VALUES ('3494', '640424', '泾源县', '3', '640400', null, '1');
INSERT INTO AREA_INFO VALUES ('3495', '640425', '彭阳县', '3', '640400', null, '1');
INSERT INTO AREA_INFO VALUES ('3496', '640500', '中卫市', '2', '640000', null, '1');
INSERT INTO AREA_INFO VALUES ('3497', '640501', '市辖区', '3', '640500', null, '1');
INSERT INTO AREA_INFO VALUES ('3498', '640502', '沙坡头区', '3', '640500', null, '1');
INSERT INTO AREA_INFO VALUES ('3499', '640521', '中宁县', '3', '640500', null, '1');
INSERT INTO AREA_INFO VALUES ('3500', '640522', '海原县', '3', '640500', null, '1');
INSERT INTO AREA_INFO VALUES ('3501', '650000', '新疆维吾尔自治区', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('3502', '650100', '乌鲁木齐市', '2', '650000', null, '1');
INSERT INTO AREA_INFO VALUES ('3503', '650101', '市辖区', '3', '650100', null, '1');
INSERT INTO AREA_INFO VALUES ('3504', '650102', '天山区', '3', '650100', null, '1');
INSERT INTO AREA_INFO VALUES ('3505', '650103', '沙依巴克区', '3', '650100', null, '1');
INSERT INTO AREA_INFO VALUES ('3506', '650104', '新市区', '3', '650100', null, '1');
INSERT INTO AREA_INFO VALUES ('3507', '650201', '市辖区', '3', '650200', null, '1');
INSERT INTO AREA_INFO VALUES ('3508', '650202', '独山子区', '3', '650200', null, '1');
INSERT INTO AREA_INFO VALUES ('3509', '650203', '克拉玛依区', '3', '650200', null, '1');
INSERT INTO AREA_INFO VALUES ('3510', '650204', '白碱滩区', '3', '650200', null, '1');
INSERT INTO AREA_INFO VALUES ('3511', '650205', '乌尔禾区', '3', '650200', null, '1');
INSERT INTO AREA_INFO VALUES ('3512', '650300', '石河子市', '2', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3513', '652100', '吐鲁番地区', '2', '650000', null, '1');
INSERT INTO AREA_INFO VALUES ('3514', '652101', '吐鲁番市', '3', '652100', null, '1');
INSERT INTO AREA_INFO VALUES ('3515', '652122', '鄯善县', '3', '652100', null, '1');
INSERT INTO AREA_INFO VALUES ('3516', '652123', '托克逊县', '3', '652100', null, '1');
INSERT INTO AREA_INFO VALUES ('3517', '652200', '哈密地区', '2', '650000', null, '1');
INSERT INTO AREA_INFO VALUES ('3518', '652201', '哈密市', '3', '652200', null, '1');
INSERT INTO AREA_INFO VALUES ('3519', '652303', '米泉市', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3520', '652323', '呼图壁县', '3', '652300', null, '1');
INSERT INTO AREA_INFO VALUES ('3521', '652324', '玛纳斯县', '3', '652300', null, '1');
INSERT INTO AREA_INFO VALUES ('3522', '652325', '奇台县', '3', '652300', null, '1');
INSERT INTO AREA_INFO VALUES ('3523', '652327', '吉木萨尔县', '3', '652300', null, '1');
INSERT INTO AREA_INFO VALUES ('2953', '330523', '安吉县', '3', '330500', null, '1');
INSERT INTO AREA_INFO VALUES ('2954', '330600', '绍兴市', '2', '330000', null, '1');
INSERT INTO AREA_INFO VALUES ('2955', '330601', '市辖区', '3', '330600', null, '1');
INSERT INTO AREA_INFO VALUES ('2956', '330602', '越城区', '3', '330600', null, '1');
INSERT INTO AREA_INFO VALUES ('2957', '330621', '绍兴县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2958', '330624', '新昌县', '3', '330600', null, '1');
INSERT INTO AREA_INFO VALUES ('2959', '330681', '诸暨市', '3', '330600', null, '1');
INSERT INTO AREA_INFO VALUES ('2960', '330682', '上虞市', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('2961', '330683', '嵊州市', '3', '330600', null, '1');
INSERT INTO AREA_INFO VALUES ('2962', '330700', '金华市', '2', '330000', null, '1');
INSERT INTO AREA_INFO VALUES ('2963', '330701', '市辖区', '3', '330700', null, '1');
INSERT INTO AREA_INFO VALUES ('2964', '330702', '婺城区', '3', '330700', null, '1');
INSERT INTO AREA_INFO VALUES ('2965', '330703', '金东区', '3', '330700', null, '1');
INSERT INTO AREA_INFO VALUES ('2966', '330723', '武义县', '3', '330700', null, '1');
INSERT INTO AREA_INFO VALUES ('2967', '330726', '浦江县', '3', '330700', null, '1');
INSERT INTO AREA_INFO VALUES ('2968', '330727', '磐安县', '3', '330700', null, '1');
INSERT INTO AREA_INFO VALUES ('2969', '330781', '兰溪市', '3', '330700', null, '1');
INSERT INTO AREA_INFO VALUES ('2970', '330782', '义乌市', '3', '330700', null, '1');
INSERT INTO AREA_INFO VALUES ('2971', '330783', '东阳市', '3', '330700', null, '1');
INSERT INTO AREA_INFO VALUES ('2972', '330784', '永康市', '3', '330700', null, '1');
INSERT INTO AREA_INFO VALUES ('2973', '330800', '衢州市', '2', '330000', null, '1');
INSERT INTO AREA_INFO VALUES ('2974', '330801', '市辖区', '3', '330800', null, '1');
INSERT INTO AREA_INFO VALUES ('2975', '330802', '柯城区', '3', '330800', null, '1');
INSERT INTO AREA_INFO VALUES ('2976', '330803', '衢江区', '3', '330800', null, '1');
INSERT INTO AREA_INFO VALUES ('2977', '330822', '常山县', '3', '330800', null, '1');
INSERT INTO AREA_INFO VALUES ('2978', '330824', '开化县', '3', '330800', null, '1');
INSERT INTO AREA_INFO VALUES ('2979', '330825', '龙游县', '3', '330800', null, '1');
INSERT INTO AREA_INFO VALUES ('2980', '330881', '江山市', '3', '330800', null, '1');
INSERT INTO AREA_INFO VALUES ('2981', '330900', '舟山市', '2', '330000', null, '1');
INSERT INTO AREA_INFO VALUES ('2982', '330901', '市辖区', '3', '330900', null, '1');
INSERT INTO AREA_INFO VALUES ('2983', '330902', '定海区', '3', '330900', null, '1');
INSERT INTO AREA_INFO VALUES ('2984', '330903', '普陀区', '3', '330900', null, '1');
INSERT INTO AREA_INFO VALUES ('2985', '330921', '岱山县', '3', '330900', null, '1');
INSERT INTO AREA_INFO VALUES ('2986', '330922', '嵊泗县', '3', '330900', null, '1');
INSERT INTO AREA_INFO VALUES ('2987', '331000', '台州市', '2', '330000', null, '1');
INSERT INTO AREA_INFO VALUES ('2988', '331001', '市辖区', '3', '331000', null, '1');
INSERT INTO AREA_INFO VALUES ('2989', '331002', '椒江区', '3', '331000', null, '1');
INSERT INTO AREA_INFO VALUES ('2990', '331003', '黄岩区', '3', '331000', null, '1');
INSERT INTO AREA_INFO VALUES ('2991', '331004', '路桥区', '3', '331000', null, '1');
INSERT INTO AREA_INFO VALUES ('2992', '331021', '玉环县', '3', '331000', null, '1');
INSERT INTO AREA_INFO VALUES ('2993', '331022', '三门县', '3', '331000', null, '1');
INSERT INTO AREA_INFO VALUES ('2994', '331023', '天台县', '3', '331000', null, '1');
INSERT INTO AREA_INFO VALUES ('2995', '331024', '仙居县', '3', '331000', null, '1');
INSERT INTO AREA_INFO VALUES ('2996', '331081', '温岭市', '3', '331000', null, '1');
INSERT INTO AREA_INFO VALUES ('2997', '331082', '临海市', '3', '331000', null, '1');
INSERT INTO AREA_INFO VALUES ('2998', '331100', '丽水市', '2', '330000', null, '1');
INSERT INTO AREA_INFO VALUES ('2999', '331101', '市辖区', '3', '331100', null, '1');
INSERT INTO AREA_INFO VALUES ('3000', '331102', '莲都区', '3', '331100', null, '1');
INSERT INTO AREA_INFO VALUES ('3001', '331121', '青田县', '3', '331100', null, '1');
INSERT INTO AREA_INFO VALUES ('3002', '331122', '缙云县', '3', '331100', null, '1');
INSERT INTO AREA_INFO VALUES ('3003', '331123', '遂昌县', '3', '331100', null, '1');
INSERT INTO AREA_INFO VALUES ('3004', '331124', '松阳县', '3', '331100', null, '1');
INSERT INTO AREA_INFO VALUES ('3005', '331125', '云和县', '3', '331100', null, '1');
INSERT INTO AREA_INFO VALUES ('3006', '331126', '庆元县', '3', '331100', null, '1');
INSERT INTO AREA_INFO VALUES ('3007', '331127', '景宁畲族自治县', '3', '331100', null, '1');
INSERT INTO AREA_INFO VALUES ('3008', '331181', '龙泉市', '3', '331100', null, '1');
INSERT INTO AREA_INFO VALUES ('3009', '340000', '安徽省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('3010', '340100', '合肥市', '2', '340000', null, '1');
INSERT INTO AREA_INFO VALUES ('3011', '4419', '长平镇', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3012', '110000', '北京市', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('3013', '110100', '市辖区', '2', '110000', null, '1');
INSERT INTO AREA_INFO VALUES ('3014', '110101', '东城区', '3', '110100', null, '1');
INSERT INTO AREA_INFO VALUES ('3015', '110102', '西城区', '3', '110100', null, '1');
INSERT INTO AREA_INFO VALUES ('3016', '110103', '崇文区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3017', '110104', '宣武区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3018', '110105', '朝阳区', '3', '110100', null, '1');
INSERT INTO AREA_INFO VALUES ('3019', '110106', '丰台区', '3', '110100', null, '1');
INSERT INTO AREA_INFO VALUES ('3020', '110107', '石景山区', '3', '110100', null, '1');
INSERT INTO AREA_INFO VALUES ('3021', '110108', '海淀区', '3', '110100', null, '1');
INSERT INTO AREA_INFO VALUES ('3022', '110109', '门头沟区', '3', '110100', null, '1');
INSERT INTO AREA_INFO VALUES ('3023', '110111', '房山区', '3', '110100', null, '1');
INSERT INTO AREA_INFO VALUES ('3024', '110112', '通州区', '3', '110100', null, '1');
INSERT INTO AREA_INFO VALUES ('3025', '110113', '顺义区', '3', '110100', null, '1');
INSERT INTO AREA_INFO VALUES ('3026', '110114', '昌平区', '3', '110100', null, '1');
INSERT INTO AREA_INFO VALUES ('3027', '110115', '大兴区', '3', '110100', null, '1');
INSERT INTO AREA_INFO VALUES ('3028', '110116', '怀柔区', '3', '110100', null, '1');
INSERT INTO AREA_INFO VALUES ('3029', '110117', '平谷区', '3', '110100', null, '1');
INSERT INTO AREA_INFO VALUES ('3030', '110200', '县', '2', '110000', null, '1');
INSERT INTO AREA_INFO VALUES ('3031', '110228', '密云县', '3', '110100', null, '1');
INSERT INTO AREA_INFO VALUES ('3032', '110229', '延庆县', '3', '110100', null, '1');
INSERT INTO AREA_INFO VALUES ('3033', '120000', '天津市', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('3034', '120100', '市辖区', '2', '120000', null, '1');
INSERT INTO AREA_INFO VALUES ('3035', '120101', '和平区', '3', '120100', null, '1');
INSERT INTO AREA_INFO VALUES ('3036', '120102', '河东区', '3', '120100', null, '1');
INSERT INTO AREA_INFO VALUES ('3037', '120103', '河西区', '3', '120100', null, '1');
INSERT INTO AREA_INFO VALUES ('3038', '120104', '南开区', '3', '120100', null, '1');
INSERT INTO AREA_INFO VALUES ('3039', '120105', '河北区', '3', '120100', null, '1');
INSERT INTO AREA_INFO VALUES ('3040', '120106', '红桥区', '3', '120100', null, '1');
INSERT INTO AREA_INFO VALUES ('3041', '120107', '塘沽区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3042', '120108', '汉沽区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3043', '120109', '大港区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3044', '120110', '东丽区', '3', '120100', null, '1');
INSERT INTO AREA_INFO VALUES ('3045', '120111', '西青区', '3', '120100', null, '1');
INSERT INTO AREA_INFO VALUES ('3046', '120112', '津南区', '3', '120100', null, '1');
INSERT INTO AREA_INFO VALUES ('3047', '120113', '北辰区', '3', '120100', null, '1');
INSERT INTO AREA_INFO VALUES ('3048', '120114', '武清区', '3', '120100', null, '1');
INSERT INTO AREA_INFO VALUES ('3049', '120115', '宝坻区', '3', '120100', null, '1');
INSERT INTO AREA_INFO VALUES ('3050', '120200', '县', '2', '120000', null, '1');
INSERT INTO AREA_INFO VALUES ('3051', '120221', '宁河县', '3', '120100', null, '1');
INSERT INTO AREA_INFO VALUES ('3052', '120223', '静海县', '3', '120100', null, '1');
INSERT INTO AREA_INFO VALUES ('3053', '120225', '蓟县', '3', '120100', null, '1');
INSERT INTO AREA_INFO VALUES ('3054', '130000', '河北省', '1', '0', null, '1');
INSERT INTO AREA_INFO VALUES ('3055', '130100', '石家庄市', '2', '130000', null, '1');
INSERT INTO AREA_INFO VALUES ('3056', '130101', '市辖区', '3', '130100', null, '1');
INSERT INTO AREA_INFO VALUES ('3057', '130102', '长安区', '3', '130100', null, '1');
INSERT INTO AREA_INFO VALUES ('3058', '130103', '桥东区', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3059', '130104', '桥西区', '3', '130100', null, '1');
INSERT INTO AREA_INFO VALUES ('3060', '130105', '新华区', '3', '130100', null, '1');
INSERT INTO AREA_INFO VALUES ('3061', '130107', '井陉矿区', '3', '130100', null, '1');
INSERT INTO AREA_INFO VALUES ('3062', '130108', '裕华区', '3', '130100', null, '1');
INSERT INTO AREA_INFO VALUES ('3063', '130121', '井陉县', '3', '130100', null, '1');
INSERT INTO AREA_INFO VALUES ('3064', '130123', '正定县', '3', '130100', null, '1');
INSERT INTO AREA_INFO VALUES ('3065', '130124', '栾城县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3066', '130125', '行唐县', '3', '130100', null, '1');
INSERT INTO AREA_INFO VALUES ('3067', '130126', '灵寿县', '3', '130100', null, '1');
INSERT INTO AREA_INFO VALUES ('3068', '130127', '高邑县', '3', '130100', null, '1');
INSERT INTO AREA_INFO VALUES ('3069', '130128', '深泽县', '3', '130100', null, '1');
INSERT INTO AREA_INFO VALUES ('3070', '130129', '赞皇县', '3', '130100', null, '1');
INSERT INTO AREA_INFO VALUES ('3071', '130130', '无极县', '3', '130100', null, '1');
INSERT INTO AREA_INFO VALUES ('3072', '130131', '平山县', '3', '130100', null, '1');
INSERT INTO AREA_INFO VALUES ('3073', '130132', '元氏县', '3', '130100', null, '1');
INSERT INTO AREA_INFO VALUES ('3074', '130133', '赵县', '3', '130100', null, '1');
INSERT INTO AREA_INFO VALUES ('3075', '130181', '辛集市', '3', '130100', null, '1');
INSERT INTO AREA_INFO VALUES ('3076', '130182', '藁城市', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3077', '130183', '晋州市', '3', '130100', null, '1');
INSERT INTO AREA_INFO VALUES ('3078', '130184', '新乐市', '3', '130100', null, '1');
INSERT INTO AREA_INFO VALUES ('3079', '130185', '鹿泉市', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3080', '130200', '唐山市', '2', '130000', null, '1');
INSERT INTO AREA_INFO VALUES ('3081', '130201', '市辖区', '3', '130200', null, '1');
INSERT INTO AREA_INFO VALUES ('3082', '130202', '路南区', '3', '130200', null, '1');
INSERT INTO AREA_INFO VALUES ('3083', '130203', '路北区', '3', '130200', null, '1');
INSERT INTO AREA_INFO VALUES ('3084', '130204', '古冶区', '3', '130200', null, '1');
INSERT INTO AREA_INFO VALUES ('3085', '130205', '开平区', '3', '130200', null, '1');
INSERT INTO AREA_INFO VALUES ('3086', '130207', '丰南区', '3', '130200', null, '1');
INSERT INTO AREA_INFO VALUES ('3087', '130208', '丰润区', '3', '130200', null, '1');
INSERT INTO AREA_INFO VALUES ('3088', '130223', '滦县', '3', '130200', null, '1');
INSERT INTO AREA_INFO VALUES ('3089', '130224', '滦南县', '3', '130200', null, '1');
INSERT INTO AREA_INFO VALUES ('3090', '130225', '乐亭县', '3', '130200', null, '1');
INSERT INTO AREA_INFO VALUES ('3091', '130227', '迁西县', '3', '130200', null, '1');
INSERT INTO AREA_INFO VALUES ('3092', '130229', '玉田县', '3', '130200', null, '1');
INSERT INTO AREA_INFO VALUES ('3093', '130230', '唐海县', '3', null, null, '1');
INSERT INTO AREA_INFO VALUES ('3094', '130281', '遵化市', '3', '130200', null, '1');
INSERT INTO AREA_INFO VALUES ('3095', '130283', '迁安市', '3', '130200', null, '1');
INSERT INTO AREA_INFO VALUES ('3096', '130300', '秦皇岛市', '2', '130000', null, '1');
INSERT INTO AREA_INFO VALUES ('3097', '130301', '市辖区', '3', '130300', null, '1');
INSERT INTO AREA_INFO VALUES ('3098', '130302', '海港区', '3', '130300', null, '1');
INSERT INTO AREA_INFO VALUES ('3099', '130303', '山海关区', '3', '130300', null, '1');
INSERT INTO AREA_INFO VALUES ('3100', '130304', '北戴河区', '3', '130300', null, '1');
INSERT INTO AREA_INFO VALUES ('3101', '130321', '青龙满族自治县', '3', '130300', null, '1');
INSERT INTO AREA_INFO VALUES ('3102', '130322', '昌黎县', '3', '130300', null, '1');
INSERT INTO AREA_INFO VALUES ('3103', '130323', '抚宁县', '3', '130300', null, '1');
INSERT INTO AREA_INFO VALUES ('3104', '130324', '卢龙县', '3', '130300', null, '1');
INSERT INTO AREA_INFO VALUES ('3105', '130400', '邯郸市', '2', '130000', null, '1');
INSERT INTO AREA_INFO VALUES ('3106', '130401', '市辖区', '3', '130400', null, '1');
INSERT INTO AREA_INFO VALUES ('3107', '130402', '邯山区', '3', '130400', null, '1');
INSERT INTO AREA_INFO VALUES ('3108', '130403', '丛台区', '3', '130400', null, '1');
INSERT INTO AREA_INFO VALUES ('3109', '130404', '复兴区', '3', '130400', null, '1');
INSERT INTO AREA_INFO VALUES ('3110', '130406', '峰峰矿区', '3', '130400', null, '1');
INSERT INTO AREA_INFO VALUES ('3111', '130421', '邯郸县', '3', '130400', null, '1');
INSERT INTO AREA_INFO VALUES ('3112', '130423', '临漳县', '3', '130400', null, '1');
INSERT INTO AREA_INFO VALUES ('3113', '130424', '成安县', '3', '130400', null, '1');
INSERT INTO AREA_INFO VALUES ('3114', '130425', '大名县', '3', '130400', null, '1');
INSERT INTO AREA_INFO VALUES ('3115', '130426', '涉县', '3', '130400', null, '1');
INSERT INTO AREA_INFO VALUES ('3116', '130427', '磁县', '3', '130400', null, '1');
INSERT INTO AREA_INFO VALUES ('3117', '130428', '肥乡县', '3', '130400', null, '1');
INSERT INTO AREA_INFO VALUES ('3118', '130429', '永年县', '3', '130400', null, '1');
INSERT INTO AREA_INFO VALUES ('3119', '130430', '邱县', '3', '130400', null, '1');
INSERT INTO AREA_INFO VALUES ('3120', '130431', '鸡泽县', '3', '130400', null, '1');
INSERT INTO AREA_INFO VALUES ('3121', '130432', '广平县', '3', '130400', null, '1');
INSERT INTO AREA_INFO VALUES ('3122', '130433', '馆陶县', '3', '130400', null, '1');
INSERT INTO AREA_INFO VALUES ('3123', '130434', '魏县', '3', '130400', null, '1');
INSERT INTO AREA_INFO VALUES ('3124', '130435', '曲周县', '3', '130400', null, '1');
INSERT INTO AREA_INFO VALUES ('3125', '130481', '武安市', '3', '130400', null, '1');
INSERT INTO AREA_INFO VALUES ('3126', '130500', '邢台市', '2', '130000', null, '1');
INSERT INTO AREA_INFO VALUES ('3127', '130501', '市辖区', '3', '130500', null, '1');
INSERT INTO AREA_INFO VALUES ('3128', '130502', '桥东区', '3', '130500', null, '1');
INSERT INTO AREA_INFO VALUES ('3129', '130503', '桥西区', '3', '130500', null, '1');
INSERT INTO AREA_INFO VALUES ('3130', '130521', '邢台县', '3', '130500', null, '1');
INSERT INTO AREA_INFO VALUES ('3131', '130522', '临城县', '3', '130500', null, '1');
INSERT INTO AREA_INFO VALUES ('3132', '130523', '内丘县', '3', '130500', null, '1');
INSERT INTO AREA_INFO VALUES ('3133', '130524', '柏乡县', '3', '130500', null, '1');
INSERT INTO AREA_INFO VALUES ('3134', '130525', '隆尧县', '3', '130500', null, '1');
INSERT INTO AREA_INFO VALUES ('3135', '130526', '任县', '3', '130500', null, '1');
INSERT INTO AREA_INFO VALUES ('3136', '130528', '宁晋县', '3', '130500', null, '1');
INSERT INTO AREA_INFO VALUES ('3137', '130529', '巨鹿县', '3', '130500', null, '1');
INSERT INTO AREA_INFO VALUES ('3138', '130530', '新河县', '3', '130500', null, '1');
INSERT INTO AREA_INFO VALUES ('3139', '130531', '广宗县', '3', '130500', null, '1');
INSERT INTO AREA_INFO VALUES ('3140', '130532', '平乡县', '3', '130500', null, '1');
INSERT INTO AREA_INFO VALUES ('3141', '130533', '威县', '3', '130500', null, '1');
INSERT INTO AREA_INFO VALUES ('3142', '130534', '清河县', '3', '130500', null, '1');
INSERT INTO AREA_INFO VALUES ('3143', '130535', '临西县', '3', '130500', null, '1');
INSERT INTO AREA_INFO VALUES ('3144', '130581', '南宫市', '3', '130500', null, '1');
INSERT INTO AREA_INFO VALUES ('3145', '130582', '沙河市', '3', '130500', null, '1');
INSERT INTO AREA_INFO VALUES ('3146', '130600', '保定市', '2', '130000', null, '1');
INSERT INTO AREA_INFO VALUES ('3147', '130601', '市辖区', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3148', '130602', '新市区', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3149', '130603', '北市区', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3150', '130604', '南市区', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3151', '130621', '满城县', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3152', '130622', '清苑县', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3153', '130623', '涞水县', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3154', '130624', '阜平县', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3155', '130625', '徐水县', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3156', '130626', '定兴县', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3157', '130627', '唐县', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3158', '130628', '高阳县', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3159', '130629', '容城县', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3160', '130630', '涞源县', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3161', '130631', '望都县', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3162', '130632', '安新县', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3163', '130633', '易县', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3164', '130634', '曲阳县', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3165', '130635', '蠡县', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3166', '130636', '顺平县', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3167', '130637', '博野县', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3168', '130638', '雄县', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3169', '130681', '涿州市', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3170', '130682', '定州市', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3171', '130683', '安国市', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3172', '130684', '高碑店市', '3', '130600', null, '1');
INSERT INTO AREA_INFO VALUES ('3173', '130700', '张家口市', '2', '130000', null, '1');
INSERT INTO AREA_INFO VALUES ('3174', '130701', '市辖区', '3', '130700', null, '1');
INSERT INTO AREA_INFO VALUES ('3175', '130702', '桥东区', '3', '130700', null, '1');
INSERT INTO AREA_INFO VALUES ('3176', '130703', '桥西区', '3', '130700', null, '1');
INSERT INTO AREA_INFO VALUES ('3177', '130705', '宣化区', '3', '130700', null, '1');
INSERT INTO AREA_INFO VALUES ('3178', '130706', '下花园区', '3', '130700', null, '1');
INSERT INTO AREA_INFO VALUES ('3179', '130721', '宣化县', '3', '130700', null, '1');
INSERT INTO AREA_INFO VALUES ('3180', '130722', '张北县', '3', '130700', null, '1');
INSERT INTO AREA_INFO VALUES ('3181', '130723', '康保县', '3', '130700', null, '1');
INSERT INTO AREA_INFO VALUES ('3182', '130724', '沽源县', '3', '130700', null, '1');
INSERT INTO AREA_INFO VALUES ('3183', '130725', '尚义县', '3', '130700', null, '1');
INSERT INTO AREA_INFO VALUES ('3184', '130726', '蔚县', '3', '130700', null, '1');
INSERT INTO AREA_INFO VALUES ('3185', '130727', '阳原县', '3', '130700', null, '1');
INSERT INTO AREA_INFO VALUES ('3186', '130728', '怀安县', '3', '130700', null, '1');
INSERT INTO AREA_INFO VALUES ('3187', '130729', '万全县', '3', '130700', null, '1');
INSERT INTO AREA_INFO VALUES ('3188', '130730', '怀来县', '3', '130700', null, '1');
INSERT INTO AREA_INFO VALUES ('3189', '130731', '涿鹿县', '3', '130700', null, '1');
INSERT INTO AREA_INFO VALUES ('3190', '130732', '赤城县', '3', '130700', null, '1');
INSERT INTO AREA_INFO VALUES ('3191', '130733', '崇礼县', '3', '130700', null, '1');
INSERT INTO AREA_INFO VALUES ('3192', '130800', '承德市', '2', '130000', null, '1');
INSERT INTO AREA_INFO VALUES ('3193', '130801', '市辖区', '3', '130800', null, '1');
INSERT INTO AREA_INFO VALUES ('3194', '130802', '双桥区', '3', '130800', null, '1');
INSERT INTO AREA_INFO VALUES ('3195', '130803', '双滦区', '3', '130800', null, '1');
INSERT INTO AREA_INFO VALUES ('3196', '130804', '鹰手营子矿区', '3', '130800', null, '1');
INSERT INTO AREA_INFO VALUES ('3197', '130821', '承德县', '3', '130800', null, '1');
INSERT INTO AREA_INFO VALUES ('3198', '130822', '兴隆县', '3', '130800', null, '1');
INSERT INTO AREA_INFO VALUES ('3199', '130823', '平泉县', '3', '130800', null, '1');
INSERT INTO AREA_INFO VALUES ('3200', '130824', '滦平县', '3', '130800', null, '1');
INSERT INTO AREA_INFO VALUES ('3201', '130825', '隆化县', '3', '130800', null, '1');
INSERT INTO AREA_INFO VALUES ('3202', '130826', '丰宁满族自治县', '3', '130800', null, '1');
INSERT INTO AREA_INFO VALUES ('3203', '130827', '宽城满族自治县', '3', '130800', null, '1');
INSERT INTO AREA_INFO VALUES ('3204', '130828', '围场满族蒙古族自治县', '3', '130800', null, '1');
INSERT INTO AREA_INFO VALUES ('3205', '130900', '沧州市', '2', '130000', null, '1');
INSERT INTO AREA_INFO VALUES ('3206', '130901', '市辖区', '3', '130900', null, '1');
INSERT INTO AREA_INFO VALUES ('3207', '130902', '新华区', '3', '130900', null, '1');
INSERT INTO AREA_INFO VALUES ('3208', '130903', '运河区', '3', '130900', null, '1');
INSERT INTO AREA_INFO VALUES ('3209', '130921', '沧县', '3', '130900', null, '1');
INSERT INTO AREA_INFO VALUES ('3210', '130922', '青县', '3', '130900', null, '1');
INSERT INTO AREA_INFO VALUES ('3211', '130923', '东光县', '3', '130900', null, '1');
INSERT INTO AREA_INFO VALUES ('3212', '130924', '海兴县', '3', '130900', null, '1');
INSERT INTO AREA_INFO VALUES ('3213', '130925', '盐山县', '3', '130900', null, '1');
INSERT INTO AREA_INFO VALUES ('3214', '130926', '肃宁县', '3', '130900', null, '1');
INSERT INTO AREA_INFO VALUES ('3215', '130927', '南皮县', '3', '130900', null, '1');
INSERT INTO AREA_INFO VALUES ('3216', '130928', '吴桥县', '3', '130900', null, '1');
INSERT INTO AREA_INFO VALUES ('3217', '130929', '献县', '3', '130900', null, '1');
INSERT INTO AREA_INFO VALUES ('3218', '130930', '孟村回族自治县', '3', '130900', null, '1');
INSERT INTO AREA_INFO VALUES ('3219', '130981', '泊头市', '3', '130900', null, '1');
INSERT INTO AREA_INFO VALUES ('3220', '513230', '壤塘县', '3', '513200', null, '1');
INSERT INTO AREA_INFO VALUES ('3221', '513231', '阿坝县', '3', '513200', null, '1');
INSERT INTO AREA_INFO VALUES ('3222', '513232', '若尔盖县', '3', '513200', null, '1');
INSERT INTO AREA_INFO VALUES ('3223', '513233', '红原县', '3', '513200', null, '1');
INSERT INTO AREA_INFO VALUES ('3224', '513300', '甘孜藏族自治州', '2', '510000', null, '1');
INSERT INTO AREA_INFO VALUES ('3225', '513321', '康定县', '3', '513300', null, '1');
INSERT INTO AREA_INFO VALUES ('3226', '513322', '泸定县', '3', '513300', null, '1');
INSERT INTO AREA_INFO VALUES ('3227', '513323', '丹巴县', '3', '513300', null, '1');
INSERT INTO AREA_INFO VALUES ('3228', '513324', '九龙县', '3', '513300', null, '1');
INSERT INTO AREA_INFO VALUES ('3229', '513325', '雅江县', '3', '513300', null, '1');
INSERT INTO AREA_INFO VALUES ('3230', '513326', '道孚县', '3', '513300', null, '1');
INSERT INTO AREA_INFO VALUES ('3231', '513327', '炉霍县', '3', '513300', null, '1');
INSERT INTO AREA_INFO VALUES ('3232', '513328', '甘孜县', '3', '513300', null, '1');
INSERT INTO AREA_INFO VALUES ('3233', '513329', '新龙县', '3', '513300', null, '1');
INSERT INTO AREA_INFO VALUES ('3234', '513330', '德格县', '3', '513300', null, '1');
INSERT INTO AREA_INFO VALUES ('3235', '513331', '白玉县', '3', '513300', null, '1');
INSERT INTO AREA_INFO VALUES ('3236', '513332', '石渠县', '3', '513300', null, '1');
INSERT INTO AREA_INFO VALUES ('3237', '513333', '色达县', '3', '513300', null, '1');
INSERT INTO AREA_INFO VALUES ('3238', '330329', '泰顺县', '3', '330300', null, '1');
INSERT INTO AREA_INFO VALUES ('3239', '513334', '理塘县', '3', '513300', null, '1');
INSERT INTO AREA_INFO VALUES ('3240', '513335', '巴塘县', '3', '513300', null, '1');
INSERT INTO AREA_INFO VALUES ('3241', '513336', '乡城县', '3', '513300', null, '1');
INSERT INTO AREA_INFO VALUES ('3242', '513337', '稻城县', '3', '513300', null, '1');
INSERT INTO AREA_INFO VALUES ('3243', '513338', '得荣县', '3', '513300', null, '1');
INSERT INTO AREA_INFO VALUES ('3244', '513400', '凉山彝族自治州', '2', '510000', null, '1');
INSERT INTO AREA_INFO VALUES ('3245', '513401', '西昌市', '3', '513400', null, '1');
INSERT INTO AREA_INFO VALUES ('3246', '513422', '木里藏族自治县', '3', '513400', null, '1');
INSERT INTO AREA_INFO VALUES ('3247', '513423', '盐源县', '3', '513400', null, '1');
INSERT INTO AREA_INFO VALUES ('3248', '513424', '德昌县', '3', '513400', null, '1');
INSERT INTO AREA_INFO VALUES ('3249', '513425', '会理县', '3', '513400', null, '1');
INSERT INTO AREA_INFO VALUES ('3250', '513426', '会东县', '3', '513400', null, '1');
INSERT INTO AREA_INFO VALUES ('3251', '513427', '宁南县', '3', '513400', null, '1');

-- ----------------------------
-- Table structure for DATA_DICTIONARY
-- ----------------------------
DROP TABLE DATA_DICTIONARY;
CREATE TABLE DATA_DICTIONARY (
ID NUMBER(11) NOT NULL ,
TREE_NODE_TYPE NUMBER(11) NOT NULL ,
FATHER_ID NUMBER(11) NOT NULL ,
LABEL VARCHAR2(100) NOT NULL ,
TYPE VARCHAR2(100),
VALUE VARCHAR2(500),
ORDER_NUM NUMBER(11) NOT NULL ,
REMARK VARCHAR2(1000),
ATTR_JSON VARCHAR2(500),
ENABLE NUMBER(2) NOT NULL DEFAULT 1
)
tablespace SMCS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
alter table DATA_DICTIONARY
  add constraint PK_DATA_DICTIONARY primary key (ID)
  using index
  tablespace SMCS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
CREATE SEQUENCE DATA_DICTIONARY_SE
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 2
 NOCACHE ;
-- ----------------------------
-- Records of DATA_DICTIONARY
-- ----------------------------
INSERT INTO DATA_DICTIONARY VALUES ('1', '0', '1', '根节点', 'ROOT', '0', '0', null, '1');

-- ----------------------------
-- Table structure for OPERATION_LOG
-- ----------------------------
DROP TABLE OPERATION_LOG;
CREATE TABLE OPERATION_LOG (
ID NUMBER(32) NOT NULL ,
USERNAME VARCHAR2(32) NOT NULL ,
IP VARCHAR2(16) NOT NULL ,
LOG_TYPE NUMBER(4) NOT NULL ,
MESSAGE VARCHAR2(2000) NOT NULL ,
MENU_PATH VARCHAR2(200),
ROUTER_PATH VARCHAR2(200),
API VARCHAR2(200),
PROCEED_TIME NUMBER(32) default 0,
TIME DATE NOT NULL
)
tablespace SMCS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
alter table OPERATION_LOG
  add constraint PK_OPERATION_LOG primary key (ID)
  using index
  tablespace SMCS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
CREATE SEQUENCE OPERATION_LOG_SE
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 1
 NOCACHE ;
-- ----------------------------
-- Table structure for RESOURCE_ACCESS
-- ----------------------------
DROP TABLE RESOURCE_ACCESS;
CREATE TABLE RESOURCE_ACCESS (
ID NUMBER(32) NOT NULL ,
ANT_RESOURCE VARCHAR2(100) NOT NULL ,
AUTHORIZATION_TYPE NUMBER(4) NOT NULL
)
tablespace SMCS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
alter table RESOURCE_ACCESS
  add constraint PK_RESOURCE_ACCESS primary key (ID)
  using index
  tablespace SMCS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
COMMENT ON COLUMN RESOURCE_ACCESS.AUTHORIZATION_TYPE IS 'denyAll(1,"denyAll"),
permitAll(2,"permitAll"),
fullyAuthenticated(3,"fullyAuthenticated"),
rememberMe(4,"rememberMe"),
authenticated(5,"authenticated"),
anonymous(6,"anonymous"),';

CREATE SEQUENCE RESOURCE_ACCESS_SE
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 14
 NOCACHE ;
-- ----------------------------
-- Records of RESOURCE_ACCESS
-- ----------------------------
INSERT INTO RESOURCE_ACCESS VALUES ('1', '/login', '6');
INSERT INTO RESOURCE_ACCESS VALUES ('2', '/logout', '6');
INSERT INTO RESOURCE_ACCESS VALUES ('3', '/img/**', '2');
INSERT INTO RESOURCE_ACCESS VALUES ('4', '/assets/**', '2');
INSERT INTO RESOURCE_ACCESS VALUES ('5', '/*.js', '2');
INSERT INTO RESOURCE_ACCESS VALUES ('6', '/**.png', '2');
INSERT INTO RESOURCE_ACCESS VALUES ('7', '/**.jpg', '2');
INSERT INTO RESOURCE_ACCESS VALUES ('8', '/**.doc', '2');
INSERT INTO RESOURCE_ACCESS VALUES ('9', '/**.xlsx', '2');
INSERT INTO RESOURCE_ACCESS VALUES ('10', '/**.docx', '2');
INSERT INTO RESOURCE_ACCESS VALUES ('11', '/favicon.ico', '6');
INSERT INTO RESOURCE_ACCESS VALUES ('12', '/favicon', '6');
INSERT INTO RESOURCE_ACCESS VALUES ('13', '/**', '5');

-- ----------------------------
-- Table structure for ROLE_MENU
-- ----------------------------
DROP TABLE ROLE_MENU;
CREATE TABLE ROLE_MENU (
ID NUMBER(32) NOT NULL ,
ROLE_ID NUMBER(32) NOT NULL ,
MENU_ID NUMBER(32) NOT NULL
)
tablespace SMCS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
alter table ROLE_MENU
  add constraint PK_ROLE_MENU primary key (ID)
  using index
  tablespace SMCS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
CREATE SEQUENCE ROLE_MENU_SE
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 6
 NOCACHE ;
-- ----------------------------
-- Records of ROLE_MENU
-- ----------------------------
INSERT INTO ROLE_MENU VALUES ('1', '2', '1');
INSERT INTO ROLE_MENU VALUES ('2', '2', '2');
INSERT INTO ROLE_MENU VALUES ('3', '2', '3');
INSERT INTO ROLE_MENU VALUES ('4', '2', '4');
INSERT INTO ROLE_MENU VALUES ('5', '2', '5');

-- ----------------------------
-- Table structure for SYSTEM_MENU
-- ----------------------------
DROP TABLE SYSTEM_MENU;
CREATE TABLE SYSTEM_MENU (
ID NUMBER(32) NOT NULL ,
FATHER_ID NUMBER(32) NOT NULL ,
TREE_NODE_TYPE NUMBER(11) NOT NULL ,
ORDER_NUM NUMBER(11) NOT NULL DEFAULT 0,
MENU_PATH VARCHAR2(100),
MENU_NAME VARCHAR2(100),
MENU_CODE VARCHAR2(100),
MENU_ICON VARCHAR2(100),
IS_VISIBLE NUMBER(2) DEFAULT 1 ,
REMARK VARCHAR2(1000) NULL
)
tablespace SMCS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
alter table SYSTEM_MENU
  add constraint PK_SYSTEM_MENU primary key (ID)
  using index
  tablespace SMCS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
CREATE SEQUENCE SYSTEM_MENU_SE
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 6
 NOCACHE ;
-- ----------------------------
-- Records of SYSTEM_MENU
-- ----------------------------
INSERT INTO SYSTEM_MENU VALUES ('1', '1', '0', '0', '/', '主页', 'dnsIndex', null, '我是主页说明');
INSERT INTO SYSTEM_MENU VALUES ('2', '1', '1', '0', '/system/operationLog', 'DNS系统', 'dnsIndex', 'el-icon-upload', '我是DNS系统说明');
INSERT INTO SYSTEM_MENU VALUES ('3', '2', '1', '0', null, '系统设置', 'system', 'el-icon-upload', '我是系统设置说明');
INSERT INTO SYSTEM_MENU VALUES ('4', '3', '2', '0', '/system/operationLog', '操作日志', 'operationLog', 'el-icon-upload', '我是操作日志说明');
INSERT INTO SYSTEM_MENU VALUES ('5', '3', '2', '1', '/system/systemDictionary', '数据字典', 'systemDictionary', 'el-icon-upload', '我是数据字典说明');

-- ----------------------------
-- Table structure for SYSTEM_ROLE
-- ----------------------------
DROP TABLE SYSTEM_ROLE;
CREATE TABLE SYSTEM_ROLE (
ID NUMBER(32) NOT NULL ,
FATHER_ID NUMBER(32) NOT NULL ,
TREE_NODE_TYPE NUMBER(11) NOT NULL ,
ORDER_NUM NUMBER(3) NOT NULL DEFAULT 0,
ROLENAME VARCHAR2(50) NOT NULL ,
REMARK VARCHAR2(100) NULL
)
tablespace SMCS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
alter table SYSTEM_ROLE
  add constraint PK_SYSTEM_ROLE primary key (ID)
  using index
  tablespace SMCS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
CREATE SEQUENCE SYSTEM_ROLE_SE
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 9
 NOCACHE ;
-- ----------------------------
-- Records of SYSTEM_ROLE
-- ----------------------------
INSERT INTO SYSTEM_ROLE VALUES ('1', '1', '0', '0', 'superAdmin', '根节点');
INSERT INTO SYSTEM_ROLE VALUES ('2', '1', '1', '0', '管理员角色', 'Commony用户');
INSERT INTO SYSTEM_ROLE VALUES ('4', '1', '1', '0', '普通用户角色', null);
INSERT INTO SYSTEM_ROLE VALUES ('8', '2', '1', '0', '维护者角色', null);

-- ----------------------------
-- Table structure for SYSTEM_USER
-- ----------------------------
DROP TABLE SYSTEM_USER;
CREATE TABLE SYSTEM_USER (
ID NUMBER(11) NOT NULL ,
USERNAME VARCHAR2(32) NOT NULL ,
DISPLAY_NAME VARCHAR2(32) NOT NULL ,
PASSWORD VARCHAR2(32) NOT NULL ,
PHONE VARCHAR2(32),
EMAIL VARCHAR2(32),
ADDR VARCHAR2(2000) NULL ,
REMARK VARCHAR2(2000) NULL ,
ENABLE NUMBER(4) NOT NULL
)
tablespace SMCS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
alter table SYSTEM_USER
  add constraint PK_SYSTEM_USER primary key (ID)
  using index
  tablespace SMCS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
CREATE SEQUENCE SYSTEM_USER_SE
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 9
 NOCACHE ;
-- ----------------------------
-- Records of SYSTEM_USER
-- ----------------------------
INSERT INTO SYSTEM_USER VALUES ('6', 'manager', '系统管理员', '8ba5f68f2e13f920bec17ac9b19c36c0', '13498989898', 'zhangpeng@act-telecom.com', null, null, '1');
INSERT INTO SYSTEM_USER VALUES ('7', 'maintainer', '系统维护员', '8ba5f68f2e13f920bec17ac9b19c36c0', '13456789876', 'zhangpeng@act-telecom.com', null, null, '1');
INSERT INTO SYSTEM_USER VALUES ('8', 'user1', '用户1', '8ba5f68f2e13f920bec17ac9b19c36c0', '13456765456', 'zhangpeng@act-telecom.com', null, null, '1');

-- ----------------------------
-- Table structure for USER_ROLE_RELATION
-- ----------------------------
DROP TABLE USER_ROLE_RELATION;
CREATE TABLE USER_ROLE_RELATION (
ID NUMBER(32) NOT NULL ,
USER_ID NUMBER(32) NOT NULL ,
ROLE_ID NUMBER(32) NOT NULL
)
tablespace SMCS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
alter table USER_ROLE_RELATION
  add constraint PK_USER_ROLE_RELATION primary key (ID)
  using index
  tablespace SMCS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
CREATE SEQUENCE USER_ROLE_RELATION_SE
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 13
 NOCACHE ;
-- ----------------------------
-- Records of USER_ROLE_RELATION
-- ----------------------------
INSERT INTO USER_ROLE_RELATION VALUES ('10', '6', '2');
INSERT INTO USER_ROLE_RELATION VALUES ('11', '7', '8');
INSERT INTO USER_ROLE_RELATION VALUES ('12', '8', '4');

-- ----------------------------
-- Sequence structure for CS0006_SE
-- ----------------------------

CREATE UNIQUE INDEX AREA_CODE_INDEX
ON AREA_INFO (AREA_CODE ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Indexes structure for table DATA_DICTIONARY
-- ----------------------------
CREATE UNIQUE INDEX DATE_DICTIONARY_TYPE_UNIQUE
ON DATA_DICTIONARY (TYPE ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Indexes structure for table SYSTEM_USER
-- ----------------------------
CREATE UNIQUE INDEX SYSTEM_USER_NAME_UNIQUE
ON SYSTEM_USER (USERNAME ASC)
LOGGING
VISIBLE;