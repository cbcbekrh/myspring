package com.myspring.jin.service;

import com.myspring.jin.domain.BoardDto;
import com.myspring.jin.domain.SearchCondition;

import java.util.List;
import java.util.Map;

public interface BoardService {
    List<BoardDto> getPage(Map map) throws Exception;
    int count() throws Exception;

    BoardDto read(Integer bno) throws Exception;

    int write(BoardDto boardDto) throws Exception;

    int update(BoardDto boardDto) throws Exception;

    int delete(Integer bno, String writer)throws Exception;


    List<BoardDto> getSearchResultPage(SearchCondition sc)throws Exception;
    int getSearchResultCnt(SearchCondition sc)throws Exception;

}
