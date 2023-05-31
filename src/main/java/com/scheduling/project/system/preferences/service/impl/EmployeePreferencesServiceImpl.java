package com.scheduling.project.system.preferences.service.impl;

import java.util.List;
import com.scheduling.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.scheduling.project.system.preferences.mapper.EmployeePreferencesMapper;
import com.scheduling.project.system.preferences.domain.EmployeePreferences;
import com.scheduling.project.system.preferences.service.IEmployeePreferencesService;
import com.scheduling.common.utils.text.Convert;

/**
 * 员工偏好Service业务层处理
 *
 * @author scheduling
 * @date 2023-02-14
 */
@Service
public class EmployeePreferencesServiceImpl implements IEmployeePreferencesService
{
    @Autowired
    private EmployeePreferencesMapper employeePreferencesMapper;

    /**
     * 查询员工偏好
     *
     * @param id 员工偏好主键
     * @return 员工偏好
     */
    @Override
    public EmployeePreferences selectEmployeePreferencesById(Long id)
    {
        return employeePreferencesMapper.selectEmployeePreferencesById(id);
    }

    /**
     * 查询员工偏好列表
     *
     * @param employeePreferences 员工偏好
     * @return 员工偏好
     */
    @Override
    public List<EmployeePreferences> selectEmployeePreferencesList(EmployeePreferences employeePreferences)
    {
        return employeePreferencesMapper.selectEmployeePreferencesList(employeePreferences);
    }

    /**
     * 新增员工偏好
     *
     * @param employeePreferences 员工偏好
     * @return 结果
     */
    @Override
    public int insertEmployeePreferences(EmployeePreferences employeePreferences)
    {
        employeePreferences.setCreateTime(DateUtils.getNowDate());
        return employeePreferencesMapper.insertEmployeePreferences(employeePreferences);
    }

    /**
     * 修改员工偏好
     *
     * @param employeePreferences 员工偏好
     * @return 结果
     */
    @Override
    public int updateEmployeePreferences(EmployeePreferences employeePreferences)
    {
        employeePreferences.setUpdateTime(DateUtils.getNowDate());
        return employeePreferencesMapper.updateEmployeePreferences(employeePreferences);
    }

    /**
     * 批量删除员工偏好
     *
     * @param ids 需要删除的员工偏好主键
     * @return 结果
     */
    @Override
    public int deleteEmployeePreferencesByIds(String ids)
    {
        return employeePreferencesMapper.deleteEmployeePreferencesByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除员工偏好信息
     *
     * @param id 员工偏好主键
     * @return 结果
     */
    @Override
    public int deleteEmployeePreferencesById(Long id)
    {
        return employeePreferencesMapper.deleteEmployeePreferencesById(id);
    }
}
