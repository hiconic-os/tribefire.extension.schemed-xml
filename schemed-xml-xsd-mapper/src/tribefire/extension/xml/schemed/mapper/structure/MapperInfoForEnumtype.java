// ============================================================================
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ============================================================================
// ============================================================================
// Copyright BRAINTRIBE TECHNOLOGY GMBH, Austria, 2002-2022
// 
// This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.
// 
// This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License along with this library; See http://www.gnu.org/licenses/.
// ============================================================================
package tribefire.extension.xml.schemed.mapper.structure;

import java.util.HashMap;
import java.util.Map;

import com.braintribe.model.meta.GmEnumConstant;
import com.braintribe.model.meta.GmEnumType;

import tribefire.extension.xml.schemed.mapping.metadata.EnumTypeMappingMetaData;

/**
 * info for a {@link GmEnumType}
 * @author pit
 *
 */
public class MapperInfoForEnumtype extends MapperInfoForType {
	private Map<String, MapperInfoForEnumConstant> protoToMapperInfoMap = new HashMap<String, MapperInfoForEnumConstant>();
	private Map<GmEnumConstant, MapperInfoForEnumConstant> enumConstantToMapperInfoMap = new HashMap<GmEnumConstant, MapperInfoForEnumConstant>();
		
	private EnumTypeMappingMetaData metadata;

	@Override
	public GmEnumType getType() {
		return (GmEnumType) type;
	}
	public void setType(GmEnumType type) {
		this.type = type;
	}
	
	public EnumTypeMappingMetaData getMetaData() {
		return metadata;
	}
	public void setMetaData(EnumTypeMappingMetaData metadata) {
		this.metadata = metadata;
	}

	public MapperInfoForEnumConstant getInfoForConstant( GmEnumConstant constant) {
		return enumConstantToMapperInfoMap.get(constant);
	}	
	public MapperInfoForEnumConstant getInfoForConstant( String constant) {
		return protoToMapperInfoMap.get( constant);
	}
	
	/**
	 * add info for a {@link GmEnumConstant} via the {@link MapperInfoForEnumConstant}
	 * @param constantInfo
	 */
	public void addEnumConstant( MapperInfoForEnumConstant constantInfo) {
		enumConstantToMapperInfoMap.put(constantInfo.getConstant(), constantInfo);
		protoToMapperInfoMap.put( constantInfo.getMetaData().getXsdName(), constantInfo);
	}
}
