package com.scheduling.project.system.staff.domain;

import java.util.List;
import com.scheduling.framework.aspectj.lang.annotation.Excel;
import com.scheduling.framework.web.domain.BaseEntity;
import com.scheduling.project.system.preferences.domain.EmployeePreferences;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 员工管理对象 staff
 *
 * @author scheduling
 * @date 2023-02-14
 */
public class Staff extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 员工ID */
    private Long id;

    /** 员工姓名 */
    @Excel(name = "员工姓名")
    private String name;

    /** 邮件 */
    @Excel(name = "邮件")
    private String email;

    /** 职位 */
    @Excel(name = "职位")
    private Long position;

    /** 员工所属门店id */
    @Excel(name = "员工所属门店id")
    private Long storeId;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;


    private Integer preferenceType;

    private String preferenceValue;

    //职位名称
    private String positionName;
    //门店名称
    private String storeName;

    /** 员工偏好信息 */
    private List<EmployeePreferences> employeePreferencesList;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }
    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getEmail()
    {
        return email;
    }

    public Long getPosition() {
        return position;
    }

    public void setPosition(Long position) {
        this.position = position;
    }

    public void setStoreId(Long storeId)
    {
        this.storeId = storeId;
    }

    public Long getStoreId()
    {
        return storeId;
    }
    public void setDelFlag(String delFlag)
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag()
    {
        return delFlag;
    }

    public List<EmployeePreferences> getEmployeePreferencesList()
    {
        return employeePreferencesList;
    }

    public void setEmployeePreferencesList(List<EmployeePreferences> employeePreferencesList)
    {
        this.employeePreferencesList = employeePreferencesList;
    }

    public Integer getPreferenceType() {
        return preferenceType;
    }

    public void setPreferenceType(Integer preferenceType) {
        this.preferenceType = preferenceType;
    }

    public String getPreferenceValue() {
        return preferenceValue;
    }

    public void setPreferenceValue(String preferenceValue) {
        this.preferenceValue = preferenceValue;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    @Override
    public String toString() {
        return "Cust{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", position=" + position +
                ", storeId=" + storeId +
                ", delFlag='" + delFlag + '\'' +
                ", preferenceType=" + preferenceType +
                ", preferenceValue=" + preferenceValue +
                ", positionName='" + positionName + '\'' +
                ", storeName='" + storeName + '\'' +
                ", employeePreferencesList=" + employeePreferencesList +
                '}';
    }
}
