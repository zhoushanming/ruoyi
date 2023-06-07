package com.scheduling.project.system.cust.domain;

import com.scheduling.framework.aspectj.lang.annotation.Excel;
import com.scheduling.framework.web.domain.BaseEntity;
import com.scheduling.project.system.preferences.domain.EmployeePreferences;

import java.math.BigDecimal;
import java.util.List;

/**
 * 员工管理对象 cust
 *
 * @author scheduling
 * @date 2023-02-14
 */
public class Cust extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 员工ID */
    private Long id;

    /** 员工姓名 */
    @Excel(name = "员工姓名")
    private String name;

    /** 性别*/
    @Excel(name = "性别")
    private String sex;

    /** 手机号*/
    @Excel(name = "手机号")
    private String phone;

    /** 余额*/
    private BigDecimal balance;
    /** 消费金额*/
    private BigDecimal consume;

    public BigDecimal getConsume() {
        return consume;
    }

    public void setConsume(BigDecimal consume) {
        this.consume = consume;
    }

    public BigDecimal getDiscount() {
        return discount;
    }

    public void setDiscount(BigDecimal discount) {
        this.discount = discount;
    }

    /** 折扣*/
    private BigDecimal discount;
    /** 充值金额*/
    @Excel(name = "充值金额")
    private BigDecimal recharge;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public BigDecimal getRecharge() {
        return recharge;
    }

    public void setRecharge(BigDecimal recharge) {
        this.recharge = recharge;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }
}
