package com.myspring.jin.service;

import com.myspring.jin.dao.BoardDao;
import com.myspring.jin.domain.BoardDto;
import com.myspring.jin.domain.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BoardServiceImpl implements BoardService {
    @Autowired
    BoardDao boardDao;

    @Override
    public List<BoardDto> getSearchResultPage(SearchCondition sc)throws Exception{
        return boardDao.searchSelectPage(sc);
    }

    @Override
    public int getSearchResultCnt(SearchCondition sc)throws Exception{
        return boardDao.searchResultCnt(sc);
    }

    @Override
    public List<BoardDto> getPage(Map map) throws Exception{
        return boardDao.selectPage(map);
    }

    @Override
    public int count() throws Exception{
        return boardDao.count();
    }

    @Override
    public BoardDto read(Integer bno) throws Exception{
        BoardDto boardDto = boardDao.read(bno);
        boardDao.view_cnt(bno);

        return boardDto;
    }

    @Override
    public int write(BoardDto boardDto)throws Exception{
        return boardDao.write(boardDto);
    }

    @Override
    public int update(BoardDto boardDto)throws Exception{
        return boardDao.update(boardDto);
    }


    @Override
    public int delete(Integer bno, String writer)throws Exception{
        return boardDao.delete(bno, writer);
    }
}
