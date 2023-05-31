package com.scheduling.project.system.store.domain;

import com.scheduling.framework.aspectj.lang.annotation.Excel;
import com.scheduling.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 门店管理对象 store
 *
 * @author scheduling
 * @date 2023-02-14
 */
public class Store extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 门店ID */
    private Long id;

    /** 门店名称 */
    @Excel(name = "门店名称")
    private String name;

    /** 门店地址 */
    @Excel(name = "门店地址")
    private String address;

    /** 门店大小（单位：平方米） */
    @Excel(name = "门店大小", readConverterExp = "单=位：平方米")
    private Long storesize;

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
    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }
    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getAddress()
    {
        return address;
    }
    public void setStoresize(Long storesize)
    {
        this.storesize = storesize;
    }

    public Long getStoresize()
    {
        return storesize;
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
            .append("name", getName())
            .append("address", getAddress())
            .append("storesize", getStoresize())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
