package com.scheduling.project.system.cust.service;

import com.scheduling.project.system.cust.domain.Cust;

import java.util.List;

/**
 * 员工管理Service接口
 *
 * @author scheduling
 * @date 2023-02-14
 */
public interface ICustService
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
     * 批量删除员工管理
     *
     * @param ids 需要删除的员工管理主键集合
     * @return 结果
     */
    public int deleteCustByIds(String ids);

    /**
     * 删除员工管理信息
     *
     * @param id 员工管理主键
     * @return 结果
     */
    public int deleteCustById(Long id);
}
