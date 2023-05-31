package com.scheduling.project.system.customer.domain;

import com.scheduling.framework.aspectj.lang.annotation.Excel;
import com.scheduling.framework.web.domain.BaseEntity;
import com.scheduling.project.system.preferences.domain.EmployeePreferences;

import java.util.List;

/**
 * 员工管理对象 staff
 *
 * @author scheduling
 * @date 2023-02-14
 */

public class Customer extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 客户ID */
    private Long id;

    /** 客户姓名 */
    @Excel(name = "客户姓名")
    private String name;

    /** 电话 */
    @Excel(name = "电话")
    private String phone;

    /** 性别 */
    @Excel(name = "性别")
    private String sex;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    /** 账户金额 */
    @Excel(name = "账户金额")
    private Double balance;

    public static long getSerialVersionUID() {
        return serialVersionUID;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }
}
