package org.dongthap.lietsi.mapper;


import org.dongthap.lietsi.model.dto.MartyrDto;
import org.dongthap.lietsi.model.dto.MartyrRequest;
import org.dongthap.lietsi.model.entity.MartyrGrave;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

import java.util.List;

@Mapper
public interface MartyrMapper {

    MartyrMapper INSTANCE = Mappers.getMapper(MartyrMapper.class);

    List<MartyrDto> toDtoList(List<MartyrGrave> all);

    MartyrGrave toEntity(MartyrDto martyrDto);

    MartyrGrave toEntity(MartyrRequest martyrRequest);

    @Mapping(target = "areaName", source = "graveRow.areaName")
    @Mapping(target = "rowName", source = "graveRow.rowName")
    MartyrDto toDto(MartyrGrave save);
}
