package com.mySpring.springEx.common.pagination.mapper;

import java.util.List;
import java.util.Map;

import com.mySpring.springEx.common.pagination.Pagination;


public interface PageMapper {

  public List<Map<String, Object>> SelectAllList() throws Exception;
  public List<Map<String, Object>> SelectAllList2() throws Exception;
  public List<Map<String, Object>> SelectAllList(Pagination pagination) throws Exception;
  public int testTableCount() throws Exception;
  public List<Map<String, Object>> SelectAllListPartner() throws Exception;
  public List<Map<String, Object>> SelectAllListPartner(Pagination pagination) throws Exception;
  public int testTableCountPartner() throws Exception;
}
