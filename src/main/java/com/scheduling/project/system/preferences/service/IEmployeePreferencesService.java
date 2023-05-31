package com.scheduling.project.system.preferences.service;

import java.util.List;
import com.scheduling.project.system.preferences.domain.EmployeePreferences;

/**
 * 员工偏好Service接口
 *
 * @author scheduling
 * @date 2023-02-14
 */
public interface IEmployeePreferencesService
{
    /**
     * 查询员工偏好
     *
     * @param id 员工偏好主键
     * @return 员工偏好
     */
    public EmployeePreferences selectEmployeePreferencesById(Long id);

    /**
     * 查询员工偏好列表
     *
     * @param employeePreferences 员工偏好
     * @return 员工偏好集合
     */
    public List<EmployeePreferences> selectEmployeePreferencesList(EmployeePreferences employeePreferences);

    /**
     * 新增员工偏好
     *
     * @param employeePreferences 员工偏好
     * @return 结果
     */
    public int insertEmployeePreferences(EmployeePreferences employeePreferences);

    /**
     * 修改员工偏好
     *
     * @param employeePreferences 员工偏好
     * @return 结果
     */
    public int updateEmployeePreferences(EmployeePreferences employeePreferences);

    /**
     * 批量删除员工偏好
     *
     * @param ids 需要删除的员工偏好主键集合
     * @return 结果
     */
    public int deleteEmployeePreferencesByIds(String ids);

    /**
     * 删除员工偏好信息
     *
     * @param id 员工偏好主键
     * @return 结果
     */
    public int deleteEmployeePreferencesById(Long id);
}
