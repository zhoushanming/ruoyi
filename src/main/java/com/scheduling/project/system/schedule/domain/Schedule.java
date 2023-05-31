package com.scheduling.project.system.schedule.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.scheduling.framework.aspectj.lang.annotation.Excel;
import com.scheduling.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 排班管理对象 schedule
 *
 * @author scheduling
 * @date 2023-02-20
 */
public class Schedule extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 员工 */
    @Excel(name = "员工")
    private String staffId;

    /** 规则ID */
    @Excel(name = "规则ID")
    private String ruleId;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    /** 开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startTime;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endtime;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }

    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }

    public void setRuleId(String ruleId)
    {
        this.ruleId = ruleId;
    }

    public String getRuleId()
    {
        return ruleId;
    }
    public void setDelFlag(String delFlag)
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag()
    {
        return delFlag;
    }
    public void setStartTime(Date startTime)
    {
        this.startTime = startTime;
    }

    public Date getStartTime()
    {
        return startTime;
    }
    public void setEndtime(Date endtime)
    {
        this.endtime = endtime;
    }

    public Date getEndtime()
    {
        return endtime;
    }

    @Override
    public String toString() {
        return "Schedule{" +
                "id=" + id +
                ", staffId='" + staffId + '\'' +
                ", ruleId='" + ruleId + '\'' +
                ", delFlag='" + delFlag + '\'' +
                ", startTime=" + startTime +
                ", endtime=" + endtime +
                '}';
    }
}
