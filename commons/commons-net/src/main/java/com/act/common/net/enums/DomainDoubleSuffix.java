package com.act.common.net.enums;

import com.act.common.other.type.DescribeType;
import com.act.common.other.type.LongType;

/**
 *
 * ClassName: DomainDoubleSuffix <br/>
 * Function: 特殊的双后缀域名<br/>
 * date: 2016年10月30日 下午8:39:02 <br/>
 *
 * @author lyc
 * @version
 * @since JDK 1.7
 */
public enum DomainDoubleSuffix implements LongType,DescribeType {
	COM_CN(1,".com.cn"),
	NET_CN(2,".net.cn"),
	ORG_CN(3,".org.cn"),
	AC_CN(4,".ac.cn"),
	AH_CN(5,".ah.cn"),
	BJ_CN(6,".bj.cn"),
	CQ_CN(7,".cq.cn"),
	FJ_CN(8,".fj.cn"),
	GD_CN(9,".gd.cn"),
	GS_CN(10,".gs.cn"),
	GX_CN(11,".gx.cn"),
	GZ_CN(12,".gz.cn"),
	HA_CN(13,".ha.cn"),
	HB_CN(14,".hb.cn"),
	HE_CN(15,".he.cn"),
	HI_CN(16,".hi.cn"),
	HK_CN(17,".hk.cn"),
	HL_CN(18,".hl.cn"),
	HN_CN(19,".hn.cn"),
	JL_CN(20,".jl.cn"),
	JS_CN(21,".js.cn"),
	JX_CN(22,".jx.cn"),
	LN_CN(23,".ln.cn"),
	MO_CN(24,".mo.cn"),
	NM_CN(25,".nm.cn"),
	NX_CN(26,".nx.cn"),
	QH_CN(27,".qh.cn"),
	SC_CN(28,".sc.cn"),
	SD_CN(29,".sd.cn"),
	SH_CN(30,".sh.cn"),
	SN_CN(31,".sn.cn"),
	SX_CN(32,".sx.cn"),
	TJ_CN(33,".tj.cn"),
	TW_CN(34,".tw.cn"),
	XJ_CN(35,".xj.cn"),
	XZ_CN(36,".xz.cn"),
	YN_CN(37,".yn.cn"),
	ZJ_CN(38,".zj.cn"),

	;
	private final long type;
	private final String describe;

	private DomainDoubleSuffix(int type,String describe){
		this.type = type;
		this.describe = describe;
	}

	@Override
	public Long getLongType() {
		return this.type;
	}

	@Override
	public String getDescribe() {
		return this.describe;
	}

}