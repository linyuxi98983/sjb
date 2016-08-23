package com.jshop.vo.cas;

import java.util.List;

import com.jshop.entity.BlDnDesignWorks;
import com.jshop.entity.LtDnAreaMeasure;
import com.jshop.entity.LtDnBudget;
import com.jshop.entity.LtDnHouseType;
import com.jshop.entity.LtDnProjectType;
import com.jshop.entity.LtDnRenovationStyle;
import com.jshop.entity.LtDnSpaceType;

public class CaseData {

	private List<LtDnRenovationStyle> styles;
	private List<LtDnHouseType> houseTypes;
	private List<LtDnBudget> budgets;
	private List<LtDnAreaMeasure> areaMeasures;
	private List<BlDnDesignWorks> designWorks;
	private List<LtDnSpaceType> spaceTypes;
	private CaseTypeIDS typeIds;
	
	private String type;
	public List<LtDnRenovationStyle> getStyles() {
		return styles;
	}
	public void setStyles(List<LtDnRenovationStyle> styles) {
		this.styles = styles;
	}
	public List<LtDnHouseType> getHouseTypes() {
		return houseTypes;
	}
	public void setHouseTypes(List<LtDnHouseType> houseTypes) {
		this.houseTypes = houseTypes;
	}
	public List<LtDnBudget> getBudgets() {
		return budgets;
	}
	public void setBudgets(List<LtDnBudget> budgets) {
		this.budgets = budgets;
	}
	public List<LtDnAreaMeasure> getAreaMeasures() {
		return areaMeasures;
	}
	public void setAreaMeasures(List<LtDnAreaMeasure> areaMeasures) {
		this.areaMeasures = areaMeasures;
	}
	public List<BlDnDesignWorks> getDesignWorks() {
		return designWorks;
	}
	public void setDesignWorks(List<BlDnDesignWorks> designWorks) {
		this.designWorks = designWorks;
	}
	public void setSpaceTypes(List<LtDnSpaceType> spaceTypes) {
		this.spaceTypes = spaceTypes;
	}
	public List<LtDnSpaceType> getSpaceTypes() {
		return spaceTypes;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	private List<LtDnProjectType> projectType;
	public List<LtDnProjectType> getProjectType() {
		return projectType;
	}
	public void setProjectType(List<LtDnProjectType> projectType) {
		this.projectType = projectType;
	}
	public CaseTypeIDS getTypeIds() {
		return typeIds;
	}
	public void setTypeIds(CaseTypeIDS typeIds) {
		this.typeIds = typeIds;
	}
	
		
}
