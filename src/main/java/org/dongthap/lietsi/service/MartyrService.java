package org.dongthap.lietsi.service;

import org.dongthap.lietsi.dto.MartyrDto;
import org.dongthap.lietsi.dto.search.SearchRequest;

import java.util.List;

public interface MartyrService {
    List<MartyrDto> findAll();

    List<MartyrDto> search(SearchRequest searchRequest);
}
