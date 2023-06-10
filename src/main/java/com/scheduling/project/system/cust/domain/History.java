package com.scheduling.project.system.cust.domain;

import com.scheduling.framework.aspectj.lang.annotation.Excel;

import java.math.BigDecimal;
import java.util.Date;

public class History {
    private Long id;

    /** 客户姓名 */
    @Excel(name = "客户编号")
    private Long custId;

    /** 操作日期*/
    @Excel(name = "操作日期")
    private Date operateDate;

    /** 消费或充值记录*/
    @Excel(name = "消费或充值记录")
    private String record;

    /** 客户姓名*/
    @Excel(name = "客户姓名")
    private String custName;

    /** 手机号*/
    @Excel(name = "手机号")
    private String phone;

    /** 消费后剩余金额*/
    @Excel(name = "消费后剩余金额")
    private BigDecimal nowBalance;
    /** 消费后剩余金额*/
    @Excel(name = "备注")
    private String remark;

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCustId() {
        return custId;
    }

    public void setCustId(Long custId) {
        this.custId = custId;
    }

    public Date getOperateDate() {
        return operateDate;
    }

    public void setOperateDate(Date operateDate) {
        this.operateDate = operateDate;
    }

    public String getRecord() {
        return record;
    }

    public void setRecord(String record) {
        this.record = record;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public BigDecimal getNowBalance() {
        return nowBalance;
    }

    public void setNowBalance(BigDecimal nowBalance) {
        this.nowBalance = nowBalance;
    }
}
