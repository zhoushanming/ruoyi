package com.scheduling.project.system.staff.mapper;

import java.util.List;

import com.scheduling.project.system.preferences.domain.EmployeePreferences;
import com.scheduling.project.system.role.domain.Role;
import com.scheduling.project.system.staff.domain.Staff;


/**
 * 员工管理Mapper接口
 *
 * @author scheduling
 * @date 2023-02-14
 */
public interface StaffMapper
{
    /**
     * 查询员工管理
     *
     * @param id 员工管理主键
     * @return 员工管理
     */
    public Staff selectStaffById(Long id);

    /**
     * 查询员工管理列表
     *
     * @param staff 员工管理
     * @return 员工管理集合
     */
    public List<Staff> selectStaffList(Staff staff);

    /**
     * 新增员工管理
     *
     * @param staff 员工管理
     * @return 结果
     */
    public int insertStaff(Staff staff);

    /**
     * 修改员工管理
     *
     * @param staff 员工管理
     * @return 结果
     */
    public int updateStaff(Staff staff);

    /**
     * 删除员工管理
     *
     * @param id 员工管理主键
     * @return 结果
     */
    public int deleteStaffById(Long id);

    /**
     * 批量删除员工管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteStaffByIds(String[] ids);

    /**
     * 批量删除员工偏好
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteEmployeePreferencesByStaffs(String[] ids);

    /**
     * 批量新增员工偏好
     *
     * @param employeePreferencesList 员工偏好列表
     * @return 结果
     */
    public int batchEmployeePreferences(List<EmployeePreferences> employeePreferencesList);


    /**
     * 通过员工管理主键删除员工偏好信息
     *
     * @param id 员工管理ID
     * @return 结果
     */
    public int deleteEmployeePreferencesByStaff(Long id);

    public List<Staff> selectStaffByName(String id);
}
