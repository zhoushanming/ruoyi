package com.scheduling.project.system.forecastdata.service.impl;

import java.util.List;
import com.scheduling.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.scheduling.project.system.forecastdata.mapper.ForecastdataMapper;
import com.scheduling.project.system.forecastdata.domain.Forecastdata;
import com.scheduling.project.system.forecastdata.service.IForecastdataService;
import com.scheduling.common.utils.text.Convert;

/**
 * 业务预测数据Service业务层处理
 *
 * @author scheduling
 * @date 2023-02-20
 */
@Service
public class ForecastdataServiceImpl implements IForecastdataService
{
    @Autowired
    private ForecastdataMapper forecastdataMapper;

    /**
     * 查询业务预测数据
     *
     * @param id 业务预测数据主键
     * @return 业务预测数据
     */
    @Override
    public Forecastdata selectForecastdataById(Long id)
    {
        return forecastdataMapper.selectForecastdataById(id);
    }

    /**
     * 查询业务预测数据列表
     *
     * @param forecastdata 业务预测数据
     * @return 业务预测数据
     */
    @Override
    public List<Forecastdata> selectForecastdataList(Forecastdata forecastdata)
    {
        return forecastdataMapper.selectForecastdataList(forecastdata);
    }

    /**
     * 新增业务预测数据
     *
     * @param forecastdata 业务预测数据
     * @return 结果
     */
    @Override
    public int insertForecastdata(Forecastdata forecastdata)
    {
        forecastdata.setCreateTime(DateUtils.getNowDate());
        return forecastdataMapper.insertForecastdata(forecastdata);
    }

    /**
     * 修改业务预测数据
     *
     * @param forecastdata 业务预测数据
     * @return 结果
     */
    @Override
    public int updateForecastdata(Forecastdata forecastdata)
    {
        forecastdata.setUpdateTime(DateUtils.getNowDate());
        return forecastdataMapper.updateForecastdata(forecastdata);
    }

    /**
     * 批量删除业务预测数据
     *
     * @param ids 需要删除的业务预测数据主键
     * @return 结果
     */
    @Override
    public int deleteForecastdataByIds(String ids)
    {
        return forecastdataMapper.deleteForecastdataByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除业务预测数据信息
     *
     * @param id 业务预测数据主键
     * @return 结果
     */
    @Override
    public int deleteForecastdataById(Long id)
    {
        return forecastdataMapper.deleteForecastdataById(id);
    }
}
