package com.scheduling.project.system.forecastdata.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.scheduling.framework.aspectj.lang.annotation.Excel;
import com.scheduling.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 业务预测数据对象 forecastdata
 *
 * @author scheduling
 * @date 2023-02-20
 */
public class Forecastdata extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 门店ID */
    @Excel(name = "门店ID")
    private Long storeId;

    /** 日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date dater;

    /** 开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date starttime;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endtime;

    /** 预测顾客流量 */
    @Excel(name = "预测顾客流量")
    private String rateflow;

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
    public void setStoreId(Long storeId)
    {
        this.storeId = storeId;
    }

    public Long getStoreId()
    {
        return storeId;
    }
    public void setDater(Date dater)
    {
        this.dater = dater;
    }

    public Date getDater()
    {
        return dater;
    }
    public void setStarttime(Date starttime)
    {
        this.starttime = starttime;
    }

    public Date getStarttime()
    {
        return starttime;
    }
    public void setEndtime(Date endtime)
    {
        this.endtime = endtime;
    }

    public Date getEndtime()
    {
        return endtime;
    }
    public void setRateflow(String rateflow)
    {
        this.rateflow = rateflow;
    }

    public String getRateflow()
    {
        return rateflow;
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
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("storeId", getStoreId())
            .append("dater", getDater())
            .append("starttime", getStarttime())
            .append("endtime", getEndtime())
            .append("rateflow", getRateflow())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
