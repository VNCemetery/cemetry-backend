package org.dongthap.lietsi.service;

import org.dongthap.lietsi.model.dto.MartyrDto;
import org.dongthap.lietsi.model.dto.MartyrRequest;
import org.dongthap.lietsi.model.dto.search.MartyrSearchRequest;
import org.springframework.data.domain.Page;

import java.util.List;

public interface MartyrService {
    List<MartyrDto> findAll();

    Page<MartyrDto> search(MartyrSearchRequest searchRequest);

    MartyrDto upsert(MartyrRequest martyrDto);

    void delete(Long id);

    MartyrDto findById(Long id);
}
