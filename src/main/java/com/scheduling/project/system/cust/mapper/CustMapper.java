package com.scheduling.project.system.cust.mapper;

import com.scheduling.project.system.cust.domain.Cust;
import com.scheduling.project.system.preferences.domain.EmployeePreferences;

import java.util.List;


/**
 * 员工管理Mapper接口
 *
 * @author scheduling
 * @date 2023-02-14
 */
public interface CustMapper
{
    /**
     * 查询员工管理
     *
     * @param id 员工管理主键
     * @return 员工管理
     */
    public Cust selectCustById(Long id);

    /**
     * 查询员工管理列表
     *
     * @param cust 员工管理
     * @return 员工管理集合
     */
    public List<Cust> selectCustList(Cust cust);

    /**
     * 新增员工管理
     *
     * @param cust 员工管理
     * @return 结果
     */
    public int insertCust(Cust cust);

    /**
     * 修改员工管理
     *
     * @param cust 员工管理
     * @return 结果
     */
    public int updateCust(Cust cust);

    /**
     * 删除员工管理
     *
     * @param id 员工管理主键
     * @return 结果
     */
    public int deleteCustById(Long id);

    /**
     * 批量删除员工管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCustByIds(String[] ids);

    /**
     * 批量删除员工偏好
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteEmployeePreferencesByCusts(String[] ids);

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
    public int deleteEmployeePreferencesByCust(Long id);

    public List<Cust> selectCustByName(String id);
}
