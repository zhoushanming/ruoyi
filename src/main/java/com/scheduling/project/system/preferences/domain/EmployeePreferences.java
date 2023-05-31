package com.scheduling.project.system.preferences.domain;

import com.scheduling.framework.aspectj.lang.annotation.Excel;
import com.scheduling.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 员工偏好对象 employee_preferences
 *
 * @author scheduling
 * @date 2023-02-14
 */
public class EmployeePreferences extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 员工偏好ID */
    private Long id;

    /** 可选值:工作日偏好、工作时间偏好、班次时长偏好。可扩展
 */
    @Excel(name = "可选值:工作日偏好、工作时间偏好、班次时长偏好。可扩展 ")
    private Integer preferenceType;

    /** 员工 */
    @Excel(name = "员工")
    private Long staff;

    /** 偏好值 */
    @Excel(name = "偏好值")
    private String preferenceValue;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setPreferenceType(Integer preferenceType)
    {
        this.preferenceType = preferenceType;
    }

    public Integer getPreferenceType()
    {
        return preferenceType;
    }

    public Long getStaff() {
        return staff;
    }

    public void setStaff(Long staff) {
        this.staff = staff;
    }

    public String getPreferenceValue() {
        return preferenceValue;
    }

    public void setPreferenceValue(String preferenceValue) {
        this.preferenceValue = preferenceValue;
    }

    public void setDelFlag(String delFlag)
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag()
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return "EmployeePreferences{" +
                "id=" + id +
                ", preferenceType=" + preferenceType +
                ", staff=" + staff +
                ", preferenceValue='" + preferenceValue + '\'' +
                ", delFlag='" + delFlag + '\'' +
                '}';
    }
}
