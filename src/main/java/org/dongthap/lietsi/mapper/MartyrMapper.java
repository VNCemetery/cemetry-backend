package org.dongthap.lietsi.mapper;


import org.dongthap.lietsi.dto.MartyrDto;
import org.dongthap.lietsi.entity.MartyrGrave;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

@Mapper
public interface MartyrMapper {

    MartyrMapper INSTANCE = Mappers.getMapper(MartyrMapper.class);

    List<MartyrDto> toDtoList(List<MartyrGrave> all);
}
