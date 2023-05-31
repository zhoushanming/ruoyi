package com.scheduling.project.system.forecastdata.mapper;

import java.util.List;
import com.scheduling.project.system.forecastdata.domain.Forecastdata;

/**
 * 业务预测数据Mapper接口
 *
 * @author scheduling
 * @date 2023-02-20
 */
public interface ForecastdataMapper
{
    /**
     * 查询业务预测数据
     *
     * @param id 业务预测数据主键
     * @return 业务预测数据
     */
    public Forecastdata selectForecastdataById(Long id);

    /**
     * 查询业务预测数据列表
     *
     * @param forecastdata 业务预测数据
     * @return 业务预测数据集合
     */
    public List<Forecastdata> selectForecastdataList(Forecastdata forecastdata);

    /**
     * 新增业务预测数据
     *
     * @param forecastdata 业务预测数据
     * @return 结果
     */
    public int insertForecastdata(Forecastdata forecastdata);

    /**
     * 修改业务预测数据
     *
     * @param forecastdata 业务预测数据
     * @return 结果
     */
    public int updateForecastdata(Forecastdata forecastdata);

    /**
     * 删除业务预测数据
     *
     * @param id 业务预测数据主键
     * @return 结果
     */
    public int deleteForecastdataById(Long id);

    /**
     * 批量删除业务预测数据
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteForecastdataByIds(String[] ids);
}
