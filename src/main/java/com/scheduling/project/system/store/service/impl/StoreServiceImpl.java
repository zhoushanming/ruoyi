package com.scheduling.project.system.store.service.impl;

import java.util.List;
import com.scheduling.common.utils.DateUtils;
import com.scheduling.common.utils.security.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.scheduling.project.system.store.mapper.StoreMapper;
import com.scheduling.project.system.store.domain.Store;
import com.scheduling.project.system.store.service.IStoreService;
import com.scheduling.common.utils.text.Convert;

/**
 * 门店管理Service业务层处理
 *
 * @author scheduling
 * @date 2023-02-14
 */
@Service
public class StoreServiceImpl implements IStoreService
{
    @Autowired
    private StoreMapper storeMapper;

    /**
     * 查询门店管理
     *
     * @param id 门店管理主键
     * @return 门店管理
     */
    @Override
    public Store selectStoreById(Long id)
    {
        return storeMapper.selectStoreById(id);
    }

    /**
     * 查询门店管理列表
     *
     * @param store 门店管理
     * @return 门店管理
     */
    @Override
    public List<Store> selectStoreList(Store store)
    {
        return storeMapper.selectStoreList(store);
    }

    /**
     * 新增门店管理
     *
     * @param store 门店管理
     * @return 结果
     */
    @Override
    public int insertStore(Store store)
    {
        store.setCreateTime(DateUtils.getNowDate());
        store.setCreateBy(ShiroUtils.getUserId().toString());
        return storeMapper.insertStore(store);
    }

    /**
     * 修改门店管理
     *
     * @param store 门店管理
     * @return 结果
     */
    @Override
    public int updateStore(Store store)
    {
        store.setUpdateTime(DateUtils.getNowDate());
        store.setUpdateBy(ShiroUtils.getUserId().toString());
        return storeMapper.updateStore(store);
    }

    /**
     * 批量删除门店管理
     *
     * @param ids 需要删除的门店管理主键
     * @return 结果
     */
    @Override
    public int deleteStoreByIds(String ids)
    {
        return storeMapper.deleteStoreByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除门店管理信息
     *
     * @param id 门店管理主键
     * @return 结果
     */
    @Override
    public int deleteStoreById(Long id)
    {
        return storeMapper.deleteStoreById(id);
    }
}
