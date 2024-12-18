package org.dongthap.lietsi.service.impl;

import java.util.List;
import java.util.Optional;

import org.dongthap.lietsi.exception.BadRequestException;
import org.dongthap.lietsi.mapper.MartyrMapper;
import org.dongthap.lietsi.model.dto.MartyrDto;
import org.dongthap.lietsi.model.dto.MartyrRequest;
import org.dongthap.lietsi.model.dto.search.MartyrSearchRequest;
import org.dongthap.lietsi.model.entity.GraveRow;
import org.dongthap.lietsi.model.entity.MartyrGrave;
import org.dongthap.lietsi.repository.GraveRowRepository;
import org.dongthap.lietsi.repository.MartyrRepository;
import org.dongthap.lietsi.repository.specification.SearchSpecification;
import org.dongthap.lietsi.service.MartyrService;
import org.dongthap.lietsi.util.CommonUtils;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import jakarta.persistence.criteria.Predicate;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MartyrServiceImpl implements MartyrService {
    private final MartyrRepository martyrRepository;
    private final GraveRowRepository graveRowRepository;

    @Override
    public List<MartyrDto> findAll() {
        return MartyrMapper.INSTANCE.toDtoList(martyrRepository.findAll());
    }

    @Override
    public List<MartyrDto> search(MartyrSearchRequest searchRequest) {
        SearchSpecification<MartyrGrave> searchSpecification = new SearchSpecification<>(searchRequest);

        Specification<MartyrGrave> nameSpec = Optional.ofNullable(searchRequest.getName())
                .map(name -> (Specification<MartyrGrave>) (root, query, cb) -> {
                    String nameLike = "%" + name.toLowerCase() + "%";
                    Predicate fullNameSpec = cb.like(cb.lower(root.get("fullName")), nameLike);
                    Predicate codeNameSpec = cb.like(cb.lower(root.get("codeName")), nameLike);
                    Predicate nameSpec1 = cb.like(cb.lower(root.get("name")), nameLike);
                    return cb.or(fullNameSpec, codeNameSpec, nameSpec1);
                })
                .orElse(null);

        Specification<MartyrGrave> finalSpec = searchSpecification.and(nameSpec);
        Pageable pageable = SearchSpecification.getPageable(searchRequest.getPage(),
                searchRequest.getSize());
        return MartyrMapper.INSTANCE.toDtoList(martyrRepository.findAll(finalSpec, pageable).getContent());
    }

    @Override
    public MartyrDto upsert(MartyrRequest martyrRequest) {
        if (CommonUtils.isNewRecord(martyrRequest.getId())) {
            // add
            MartyrGrave martyrGrave = MartyrMapper.INSTANCE.toEntity(martyrRequest);
            martyrGrave.setId(null);
            return MartyrMapper.INSTANCE.toDto(martyrRepository.save(martyrGrave));
        }
        // update
        MartyrGrave martyrGrave = martyrRepository.findById(martyrRequest.getId())
                .orElseThrow(() -> BadRequestException.message("Không tìm thấy liệt sĩ"));
        GraveRow graveRow = graveRowRepository.findById(martyrRequest.getGraveRowId())
                .orElseThrow(() -> BadRequestException.message("Không tìm thấy hàng mộ"));

        martyrGrave.setGraveRow(graveRow);
        martyrGrave.setImage(martyrRequest.getImage());
        martyrGrave.setFullName(martyrRequest.getFullName());
        martyrGrave.setName(martyrRequest.getName());
        martyrGrave.setCodeName(martyrRequest.getCodeName());
        martyrGrave.setYearOfBirth(martyrRequest.getYearOfBirth());
        martyrGrave.setDateOfEnlistment(martyrRequest.getDateOfEnlistment());
        martyrGrave.setDateOfDeath(martyrRequest.getDateOfDeath());
        martyrGrave.setRankPositionUnit(martyrRequest.getRankPositionUnit());
        martyrGrave.setHomeTown(martyrRequest.getHomeTown());
        martyrGrave.setPlaceOfExhumation(martyrRequest.getPlaceOfExhumation());
        martyrGrave.setDieuChinh(martyrRequest.getDieuChinh());
        martyrGrave.setQuyTap(martyrRequest.getQuyTap());
        martyrGrave.setNgayThangNam(martyrRequest.getNgayThangNam());
        martyrGrave.setNote(martyrRequest.getNote());
        martyrGrave.setCommune(martyrRequest.getCommune());
        martyrGrave.setDistrict(martyrRequest.getDistrict());

        return MartyrMapper.INSTANCE.toDto(martyrRepository.save(martyrGrave));
    }

    @Override
    public void delete(Long id) {
        martyrRepository.deleteById(id);
    }

    @Override
    public MartyrDto findById(Long id) {
        return martyrRepository.findById(id)
                .map(MartyrMapper.INSTANCE::toDto)
                .orElseThrow(() -> BadRequestException.message("Không tìm thấy liệt sĩ"));
    }
}
