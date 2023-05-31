package com.scheduling.project.system.rules.domain;

import com.scheduling.framework.aspectj.lang.annotation.Excel;
import com.scheduling.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 排版规则管理对象 typesetting_rules
 *
 * @author scheduling
 * @date 2023-02-14
 */
public class TypesettingRules extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 排版规则ID */
    private Long id;

    /** 可选值:开店规则、关店规则、客流规则。可扩展 */
    @Excel(name = "可选值:开店规则、关店规则、客流规则。可扩展")
    private Integer rulesType;

    /** 门店 */
    @Excel(name = "门店")
    private String store;

    /** 规则值 */
    @Excel(name = "规则值")
    private String ruleValue;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;
   /**排班规则（1.固定规则2.自定义规则）*/
    private Integer ruleStatus;

    private String storeName;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setRulesType(Integer rulesType)
    {
        this.rulesType = rulesType;
    }

    public Integer getRulesType()
    {
        return rulesType;
    }
    public void setStore(String store)
    {
        this.store = store;
    }

    public String getStore()
    {
        return store;
    }
    public void setRuleValue(String ruleValue)
    {
        this.ruleValue = ruleValue;
    }

    public String getRuleValue()
    {
        return ruleValue;
    }
    public void setDelFlag(String delFlag)
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag()
    {
        return delFlag;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public Integer getRuleStatus() {
        return ruleStatus;
    }

    public void setRuleStatus(Integer ruleStatus) {
        this.ruleStatus = ruleStatus;
    }

    @Override
    public String toString() {
        return "TypesettingRules{" +
                "id=" + id +
                ", rulesType=" + rulesType +
                ", store='" + store + '\'' +
                ", ruleValue='" + ruleValue + '\'' +
                ", delFlag='" + delFlag + '\'' +
                ", ruleStatus=" + ruleStatus +
                ", storeName='" + storeName + '\'' +
                '}';
    }
}
