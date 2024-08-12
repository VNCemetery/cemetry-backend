package org.dongthap.lietsi.service.impl;

import lombok.RequiredArgsConstructor;
import org.dongthap.lietsi.dto.MartyrDto;
import org.dongthap.lietsi.dto.search.SearchRequest;
import org.dongthap.lietsi.entity.MartyrGrave;
import org.dongthap.lietsi.mapper.MartyrMapper;
import org.dongthap.lietsi.repository.MartyrRepository;
import org.dongthap.lietsi.repository.specification.SearchSpecification;
import org.dongthap.lietsi.service.MartyrService;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MartyrServiceImpl implements MartyrService {
    private final MartyrRepository martyrRepository;

    @Override
    public List<MartyrDto> findAll() {
        return MartyrMapper.INSTANCE.toDtoList(martyrRepository.findAll());
    }

    @Override
    public List<MartyrDto> search(SearchRequest searchRequest) {
        SearchSpecification<MartyrGrave> searchSpecification = new SearchSpecification<>(searchRequest);
        Pageable pageable = SearchSpecification.getPageable(searchRequest.getPage(),
                searchRequest.getSize());
        return MartyrMapper.INSTANCE.toDtoList(martyrRepository.findAll(searchSpecification, pageable).getContent());
    }
}
