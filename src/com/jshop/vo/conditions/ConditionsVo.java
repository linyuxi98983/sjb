package com.jshop.vo.conditions;

public class ConditionsVo {

	private String costAmt;
	private String sqm;
	private int minSqm = 0;
	private int maxSqm = 0;
	private int minAmt = 0;
	private int maxAmt = 0;
	public ConditionsVo() {
		super();
	}

	public ConditionsVo(String costAmt, String sqm) {
		super();
		this.costAmt = costAmt;
		this.sqm = sqm;		
	}

	public String getCostAmt() {
		return costAmt;
	}
	public void setCostAmt(String costAmt) {
		this.costAmt = costAmt;
	}
	public String getSqm() {
		return sqm;
	}
	public void setSqm(String sqm) {
		this.sqm = sqm;
	}
	public int getMinSqm() {
		return minSqm;
	}
	public void setMinSqm(int minSqm) {
		this.minSqm = minSqm;
	}
	public int getMaxSqm() {
		return maxSqm;
	}
	public void setMaxSqm(int maxSqm) {
		this.maxSqm = maxSqm;
	}
	public int getMinAmt() {
		return minAmt;
	}
	public void setMinAmt(int minAmt) {
		this.minAmt = minAmt;
	}
	public int getMaxAmt() {
		return maxAmt;
	}
	public void setMaxAmt(int maxAmt) {
		this.maxAmt = maxAmt;
	}
	
	
	public static ConditionsVo getData(String costAmt, String sqm){		
		ConditionsVo vo = new ConditionsVo();
		try {
			if(costAmt != null && !"".equals(costAmt)){
				String[] costAmtArr = costAmt.split("-");
				vo.setMinAmt(Integer.parseInt(costAmtArr[0]));
				vo.setMaxAmt(Integer.parseInt(costAmtArr[1]));
			}
			if(sqm != null && !"".equals(sqm)){
				String[] sqmArr = sqm.split("-");
				vo.setMinSqm(Integer.parseInt(sqmArr[0]));
				vo.setMaxSqm(Integer.parseInt(sqmArr[1]));
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return vo;
	}
}
