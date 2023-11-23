<?xml version="1.0" encoding="UTF-8"?>
<!-- Version 1.1 -->
<!-- Author: Walter Burkhard, West Informatik AG -->
<!-- Modified: 04.07.2016 -->

<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:px="urn:iso:std:iso:20022:tech:xsd:pain.001.001.02"
    exclude-result-prefixes="px ">
  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <px:PayOrder xmlns="urn:FIDES">
      <MessageIdentification>
        <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:MsgId"/>
      </MessageIdentification>
      <MessageNameIdentification>pain.001.001.02</MessageNameIdentification>
      <CreationDateTime>
        <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:CreDtTm"/>
      </CreationDateTime>
      <NumberOfTransactions>
        <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:NbOfTxs"/>
      </NumberOfTransactions>
      <xsl:if test="/px:Document/px:pain.001.001.02/px:GrpHdr/px:CtrlSum">
        <ControlSum>
          <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:CtrlSum"/>
        </ControlSum>
      </xsl:if>
      <InitiatingParty>
        <Name>
          <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Nm"/>
        </Name>
        <PostalAdrAddressType>
          <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:PstlAdr/px:AdrTp"/>
        </PostalAdrAddressType>
        <PostalAdrDepartment/>
        <PostalAdrSubDepartment/>
        <PostalAdrStreetName>
          <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:PstlAdr/px:StrtNm"/>
        </PostalAdrStreetName>
        <PostalAdrBuildingNumber>
          <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:PstlAdr/px:BldgNb"/>
        </PostalAdrBuildingNumber>
        <PostalAdrPostCode>
          <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:PstlAdr/px:PstCd"/>
        </PostalAdrPostCode>
        <PostalAdrTownName>
          <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:PstlAdr/px:TwnNm"/>
        </PostalAdrTownName>
        <PostalAdrCountrySubDivision>
          <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:PstlAdr/px:CtrySubDvsn"/>
        </PostalAdrCountrySubDivision>
        <PostalAdrCountryCode>
          <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:PstlAdr/px:Ctry"/>
        </PostalAdrCountryCode>
        
        <xsl:for-each select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:PstlAdr/px:AdrLine">
          <xsl:if test="7&gt;position()">
            <PostalAdrAddressLine>
              <xsl:value-of select="."/>
            </PostalAdrAddressLine>
          </xsl:if>
        </xsl:for-each>
        <OrgIdentBIC>
		<xsl:choose>
		  <xsl:when test="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:OrgId/px:BIC">
			<xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:OrgId/px:BIC"/>
		  </xsl:when>
		  <xsl:when test="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:OrgId/px:IBEI">
			<xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:OrgId/px:IBEI"/>
		  </xsl:when>
		  <xsl:when test="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:OrgId/px:BEI">
			<xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:OrgId/px:BEI"/>
		  </xsl:when>		  
		  </xsl:choose>
        </OrgIdentBIC>
        <OrganisIdentOtherIdentification>
		<xsl:choose>
		  <xsl:when test="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:OrgId/px:EANGLN">
			<xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:OrgId/px:EANGLN"/>
		  </xsl:when>
		  <xsl:when test="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:OrgId/px:USCHU">
			<xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:OrgId/px:USCHU"/>
		  </xsl:when>
		  <xsl:when test="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:OrgId/px:DUNS">
			<xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:OrgId/px:DUNS"/>
		  </xsl:when>
		  <xsl:when test="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:OrgId/px:BkPtyId">
			<xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:OrgId/px:BkPtyId"/>
		  </xsl:when>
		  <xsl:when test="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:OrgId/px:TaxIdNb">
			<xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:OrgId/px:TaxIdNb"/>
		  </xsl:when>		  
		  </xsl:choose>
        </OrganisIdentOtherIdentification>
        <OrganisIdentOtherCode/>
        <OrganisIdentOtherProprietary>
          <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:OrgId/px:PrtryId/px:Id"/>
        </OrganisIdentOtherProprietary>
        <OrganisIdentOtherIssuer>
          <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:OrgId/px:PrtryId/px:Issr"/>
        </OrganisIdentOtherIssuer>
        <PrivateIdentBirthDate>
          <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:BirthDt"/>
        </PrivateIdentBirthDate>
        <PrivateIdentProvinceOfBirth>
          <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:PrvcOfBirth"/>
        </PrivateIdentProvinceOfBirth>
        <PrivateIdentCityOfBirth>
          <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:CityOfBirth"/>
        </PrivateIdentCityOfBirth>
        <PrivateIdentCountryOfBirth>
          <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:CtryOfBirth"/>
        </PrivateIdentCountryOfBirth>
        <OtherPersonIdentification>
          <PrivateIdentOtherIdentification/>
          <PrivateIdentOtherCode/>
          <PrivateIdentOtherProprietary>
            <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:PrvtId/px:OthrId/px:Id"/>
          </PrivateIdentOtherProprietary>
          <PrivateIdentOtherIssuer>
            <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:Id/px:PrvtId/px:Issr"/>
          </PrivateIdentOtherIssuer>
        </OtherPersonIdentification>        
        <CountryOfResidence>
          <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:InitgPty/px:CtryOfRes"/>
        </CountryOfResidence>
        <ContactDetailsNamePrefix/>
        <ContactDetailsName/>
        <ContactDetailsPhoneNumber/>
        <ContactDetailsMobileNumber/>
        <ContactDetailsFaxNumber/>
        <ContactDetailsEmailAddress/>
        <ContactDetailsOther/>
      </InitiatingParty>
      <PaymentType>CreditTransfer</PaymentType>
      <xsl:for-each select="/px:Document/px:pain.001.001.02/px:PmtInf">
        <PayContainer>
          <CreditTransfer> 
          <OrderReference/>
          <CurrencyCode/>
          <PaymentInformationIdentification>
            <xsl:value-of select="px:PmtInfId"/>
          </PaymentInformationIdentification>
          <PaymentMethod>
            <xsl:value-of select="px:PmtMtd"/>
          </PaymentMethod>
          <BatchBooking>            
           <xsl:choose>
             <xsl:when test="not(/px:Document/px:pain.001.001.02/px:GrpHdr/px:BtchBookg) or /px:Document/px:pain.001.001.02/px:GrpHdr/px:BtchBookg = ''">
              <xsl:value-of select="'true'"/>
             </xsl:when>
             <xsl:otherwise>
              <xsl:value-of select="/px:Document/px:pain.001.001.02/px:GrpHdr/px:BtchBookg"/>
             </xsl:otherwise>
           </xsl:choose>            
          </BatchBooking>
          <NumberOfTransactions/>
          <ControlSum/>
          <PaymentInfoInstructionPriority>
            <xsl:value-of select="px:PmtTpInf/px:InstrPrty"/>
          </PaymentInfoInstructionPriority>
          <PaymentInfoServiceLevelCode>
            <xsl:value-of select="px:PmtTpInf/px:SvcLvl/px:Cd"/>
          </PaymentInfoServiceLevelCode>
          <PaymentInfoServiceLevelProprietary>
            <xsl:value-of select="px:PmtTpInf/px:SvcLvl/px:Prtry"/>
          </PaymentInfoServiceLevelProprietary>
          <PaymentInfoLocalInstrumentCode>
            <xsl:value-of select="px:PmtTpInf/px:LclInstrm/px:Cd"/>
          </PaymentInfoLocalInstrumentCode>
          <PaymentInfoLocalInstrumentProprietary>
            <xsl:value-of select="px:PmtTpInf/px:LclInstrm/px:Prtry"/>
          </PaymentInfoLocalInstrumentProprietary>
          <PaymentInfoCategoryPurposeCode>
            <xsl:value-of select="px:PmtTpInf/px:CtgyPurp"/>
          </PaymentInfoCategoryPurposeCode>
          <PaymentInfoCategoryPurposeProprietary/>
          <RequestedExecutionDate>
            <xsl:value-of select="px:ReqdExctnDt"/>
          </RequestedExecutionDate>
          <DebtorPartyIdentification>
            <Name>
              <xsl:value-of select="px:Dbtr/px:Nm"/>
            </Name>
            <PostalAdrAddressType>
              <xsl:value-of select="px:Dbtr/px:PstlAdr/px:AdrTp"/>
            </PostalAdrAddressType>
            <PostalAdrDepartment/>
            <PostalAdrSubDepartment/>
            <PostalAdrStreetName>
              <xsl:value-of select="px:Dbtr/px:PstlAdr/px:StrtNm"/>
            </PostalAdrStreetName>
            <PostalAdrBuildingNumber>
              <xsl:value-of select="px:Dbtr/px:PstlAdr/px:BldgNb"/>
            </PostalAdrBuildingNumber>
            <PostalAdrPostCode>
              <xsl:value-of select="px:Dbtr/px:PstlAdr/px:PstCd"/>
            </PostalAdrPostCode>
            <PostalAdrTownName>
              <xsl:value-of select="px:Dbtr/px:PstlAdr/px:TwnNm"/>
            </PostalAdrTownName>
            <PostalAdrCountrySubDivision>
              <xsl:value-of select="px:Dbtr/px:PstlAdr/px:CtrySubDvsn"/>
            </PostalAdrCountrySubDivision>
            <PostalAdrCountryCode>
              <xsl:value-of select="px:Dbtr/px:PstlAdr/px:Ctry"/>
            </PostalAdrCountryCode>
            
          <xsl:for-each select="px:Dbtr/px:PstlAdr/px:AdrLine">
            <xsl:if test="7&gt;position()">
              <PostalAdrAddressLine>
                <xsl:value-of select="."/>
              </PostalAdrAddressLine>
            </xsl:if>
          </xsl:for-each>
          
			<OrgIdentBIC>
			<xsl:choose>
			  <xsl:when test="px:Dbtr/px:Id/px:OrgId/px:BIC">
				<xsl:value-of select="px:Dbtr/px:Id/px:OrgId/px:BIC"/>
			  </xsl:when>
			  <xsl:when test="px:Dbtr/px:Id/px:OrgId/px:IBEI">
				<xsl:value-of select="px:Dbtr/px:Id/px:OrgId/px:IBEI"/>
			  </xsl:when>
			  <xsl:when test="px:Dbtr/px:Id/px:OrgId/px:BEI">
				<xsl:value-of select="px:Dbtr/px:Id/px:OrgId/px:BEI"/>
			  </xsl:when>		  
			  </xsl:choose>
			</OrgIdentBIC>
			<OrganisIdentOtherIdentification>
			<xsl:choose>
			  <xsl:when test="px:Dbtr/px:Id/px:OrgId/px:EANGLN">
				<xsl:value-of select="px:Dbtr/px:Id/px:OrgId/px:EANGLN"/>
			  </xsl:when>
			  <xsl:when test="px:Dbtr/px:Id/px:OrgId/px:USCHU">
				<xsl:value-of select="px:Dbtr/px:Id/px:OrgId/px:USCHU"/>
			  </xsl:when>
			  <xsl:when test="px:Dbtr/px:Id/px:OrgId/px:DUNS">
				<xsl:value-of select="px:Dbtr/px:Id/px:OrgId/px:DUNS"/>
			  </xsl:when>
			  <xsl:when test="px:Dbtr/px:Id/px:OrgId/px:BkPtyId">
				<xsl:value-of select="px:Dbtr/px:Id/px:OrgId/px:BkPtyId"/>
			  </xsl:when>
			  <xsl:when test="px:Dbtr/px:Id/px:OrgId/px:TaxIdNb">
				<xsl:value-of select="px:Dbtr/px:Id/px:OrgId/px:TaxIdNb"/>
			  </xsl:when>		  
			  </xsl:choose>
			</OrganisIdentOtherIdentification>
            <OrganisIdentOtherCode/>
            <OrganisIdentOtherProprietary>
              <xsl:value-of select="px:Dbtr/px:Id/px:OrgId/px:PrtryId/px:Id"/>
            </OrganisIdentOtherProprietary>
            <OrganisIdentOtherIssuer>
              <xsl:value-of select="px:Dbtr/px:Id/px:OrgId/px:PrtryId/px:Issr"/>
            </OrganisIdentOtherIssuer>
            <PrivateIdentBirthDate>
              <xsl:value-of select="px:Dbtr/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:BirthDt"/>
            </PrivateIdentBirthDate>
            <PrivateIdentProvinceOfBirth>
              <xsl:value-of select="px:Dbtr/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:PrvcOfBirth"/>
            </PrivateIdentProvinceOfBirth>
            <PrivateIdentCityOfBirth>
              <xsl:value-of select="px:Dbtr/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:CityOfBirth"/>
            </PrivateIdentCityOfBirth>
            <PrivateIdentCountryOfBirth>
              <xsl:value-of select="px:Dbtr/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:CtryOfBirth"/>
            </PrivateIdentCountryOfBirth>
            <OtherPersonIdentification>
              <PrivateIdentOtherIdentification>
                <xsl:value-of select="px:Dbtr/px:Id/px:PrvtId/px:OthrId/px:Id"/>
              </PrivateIdentOtherIdentification>
              <PrivateIdentOtherCode/>
              <PrivateIdentOtherProprietary/>
              <PrivateIdentOtherIssuer>
                <xsl:value-of select="px:Dbtr/px:Id/px:PrvtId/px:Issr"/>
              </PrivateIdentOtherIssuer>
            </OtherPersonIdentification>
            <CountryOfResidence/>
            <ContactDetailsNamePrefix/>
            <ContactDetailsName/>
            <ContactDetailsPhoneNumber/>
            <ContactDetailsMobileNumber/>
            <ContactDetailsFaxNumber/>
            <ContactDetailsEmailAddress/>
            <ContactDetailsOther/>
          </DebtorPartyIdentification>
          <DebtorAccountIBAN>
            <xsl:value-of select="px:DbtrAcct/px:Id/px:IBAN"/>
          </DebtorAccountIBAN>
          <SelectedAccountAlias/>
          <DebtorAccountOtherIdentification>
			  <xsl:choose>
			    <xsl:when test="px:DbtrAcct/px:Id/px:BBAN">
				  <xsl:value-of select="px:DbtrAcct/px:Id/px:BBAN"/>
			    </xsl:when>
			    <xsl:when test="px:DbtrAcct/px:Id/px:UPIC">
				  <xsl:value-of select="px:DbtrAcct/px:Id/px:UPIC"/>
			    </xsl:when>
				<xsl:when test="px:DbtrAcct/px:Id/px:PrtryAcct/px:Id">
				  <xsl:value-of select="px:DbtrAcct/px:Id/px:PrtryAcct/px:Id"/>
			    </xsl:when>
			  </xsl:choose>
          </DebtorAccountOtherIdentification>
          <DebtorAccountOtherIdNameCode/>
          <DebtorAccountOtherIdNameProprietary/>
          <DebtorAccountOtherIdIssuer/>
          <DebtorAccountTypeCode>
            <xsl:value-of select="px:DbtrAcct/px:Tp/px:Cd"/>
          </DebtorAccountTypeCode>
          <DebtorAccountTypeProprietary>
            <xsl:value-of select="px:DbtrAcct/px:Tp/px:Prtry"/>
          </DebtorAccountTypeProprietary>
          <DebtorAccountCurrency>
            <xsl:value-of select="px:DbtrAcct/px:Ccy"/>
          </DebtorAccountCurrency>
          <DebtorAccountName>
            <xsl:value-of select="px:DbtrAcct/px:Nm"/>
          </DebtorAccountName>
          <DebtorAgentFinancialInstitution>
			<FinInstBIC>
				<xsl:choose>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:BIC">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:BIC"/>
				</xsl:when>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:BIC">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:BIC"/>
				</xsl:when>
				</xsl:choose>
			</FinInstBIC>
			<FinInstClearingSystemIdentifCode>
				<xsl:choose>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:ClrSysMmbId/px:Id">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:ClrSysMmbId/px:Id"/>
				</xsl:when>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:ClrSysMmbId/px:Id">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:ClrSysMmbId/px:Id"/>
				</xsl:when>
				</xsl:choose>				
			</FinInstClearingSystemIdentifCode>
			<FinInstClearingSystemIdentifProprietary>
				<xsl:choose>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:ClrSysMmbId/px:Prtry">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:ClrSysMmbId/px:Prtry"/>
				</xsl:when>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:ClrSysMmbId/px:Prtry">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:ClrSysMmbId/px:Prtry"/>
				</xsl:when>
				</xsl:choose>					  
			</FinInstClearingSystemIdentifProprietary>
			<FinInstMemberIdentification/>
			<FinInstName>
				<xsl:choose>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:NmAndAdr/px:Nm">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:NmAndAdr/px:Nm"/>
				</xsl:when>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:Nm">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:Nm"/>
				</xsl:when>
				</xsl:choose>					  
			</FinInstName>
			<FinInstPostalAdrAddressType>
				<xsl:choose>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:AdrTp">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:AdrTp"/>
				</xsl:when>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:AdrTp">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:AdrTp"/>
				</xsl:when>
				</xsl:choose>					  
			</FinInstPostalAdrAddressType>
			<FinInstPostalAdrDepartment/>
			<FinInstPostalAdrSubDepartment/>
			<FinInstPostalAdrStreetName>
				<xsl:choose>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:StrtNm">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:StrtNm"/>
				</xsl:when>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:StrtNm">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:StrtNm"/>
				</xsl:when>
				</xsl:choose>				  
			</FinInstPostalAdrStreetName>
			<FinInstPostalAdrBuildingNumber>
				<xsl:choose>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:BldgNb">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:BldgNb"/>
				</xsl:when>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:BldgNb">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:BldgNb"/>
				</xsl:when>
				</xsl:choose>					  
			</FinInstPostalAdrBuildingNumber>
			<FinInstPostalAdrPostCode>
				<xsl:choose>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:PstCd">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:PstCd"/>
				</xsl:when>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:PstCd">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:PstCd"/>
				</xsl:when>
				</xsl:choose>
			</FinInstPostalAdrPostCode>
			<FinInstPostalAdrTownName>
				<xsl:choose>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:TwnNm">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:TwnNm"/>
				</xsl:when>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:TwnNm">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:TwnNm"/>
				</xsl:when>
				</xsl:choose>
			</FinInstPostalAdrTownName>
			<FinInstPostalAdrCountrySubDivision>
				<xsl:choose>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:CtrySubDvsn">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:CtrySubDvsn"/>
				</xsl:when>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:CtrySubDvsn">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:CtrySubDvsn"/>
				</xsl:when>
				</xsl:choose>				  
			</FinInstPostalAdrCountrySubDivision>
			<FinInstPostalAdrCountry>
				<xsl:choose>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:Ctry">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:Ctry"/>
				</xsl:when>
				<xsl:when test="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:Ctry">
				  <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:Ctry"/>
				</xsl:when>
				</xsl:choose>					  
			</FinInstPostalAdrCountry>
				
      <xsl:for-each select="px:DbtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:AdrLine">
        <xsl:if test="7&gt;position()">
          <FinInstPostalAdrAddressLine>
            <xsl:value-of select="."/>
          </FinInstPostalAdrAddressLine>
        </xsl:if>
      </xsl:for-each>
          
            <FinInstOtherIdentification>
              <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:PrtryId/px:Id"/>
            </FinInstOtherIdentification>
            <FinInstOtherSchemeNameCode/>
            <FinInstIOtherSchemeNameProprietary/>
            <FinInstOtherIssuer>
              <xsl:value-of select="px:DbtrAgt/px:FinInstnId/px:PrtryId/px:Issr"/>
            </FinInstOtherIssuer>
            <BrnchIdentification>
              <xsl:value-of select="px:DbtrAgt/px:BrnchId/px:Id"/>
            </BrnchIdentification>
            <BrnchIdName>
              <xsl:value-of select="px:DbtrAgt/px:BrnchId/px:Nm"/>
            </BrnchIdName>
            <BrnchPostalAdrAddressType>
              <xsl:value-of select="px:DbtrAgt/px:BrnchId/px:PstlAdr/px:AdrTp"/>
            </BrnchPostalAdrAddressType>
            <BrnchPostalAdrDepartment/>
            <BrnchPostalAdrSubDepartment/>
            <BrnchPostalAdrStreetName>
              <xsl:value-of select="px:DbtrAgt/px:BrnchId/px:PstlAdr/px:StrtNm"/>
            </BrnchPostalAdrStreetName>
            <BrnchPostalAdrBuildingNumber>
              <xsl:value-of select="px:DbtrAgt/px:BrnchId/px:PstlAdr/px:BldgNb"/>
            </BrnchPostalAdrBuildingNumber>
            <BrnchPostalAdrPostCode>
              <xsl:value-of select="px:DbtrAgt/px:BrnchId/px:PstlAdr/px:PstCd"/>
            </BrnchPostalAdrPostCode>
            <BrnchPostalAdrTownName>
              <xsl:value-of select="px:DbtrAgt/px:BrnchId/px:PstlAdr/px:TwnNm"/>
            </BrnchPostalAdrTownName>
            <BrnchPostalAdrCountrySubDivision>
              <xsl:value-of select="px:DbtrAgt/px:BrnchId/px:PstlAdr/px:CtrySubDvsn"/>
            </BrnchPostalAdrCountrySubDivision>
            <BrnchPostalAdrCountry>
              <xsl:value-of select="px:DbtrAgt/px:BrnchId/px:PstlAdr/px:Ctry"/>
            </BrnchPostalAdrCountry>
            
      <xsl:for-each select="px:DbtrAgt/px:BrnchId/px:PstlAdr/px:AdrLine">
        <xsl:if test="7&gt;position()">
          <BrnchPostalAdrAddressLine>
            <xsl:value-of select="."/>
          </BrnchPostalAdrAddressLine>
        </xsl:if>
      </xsl:for-each>
      
          </DebtorAgentFinancialInstitution>
          <ChargeBearer>
            <xsl:value-of select="px:ChrgBr"/>
          </ChargeBearer>
          <ChargesAccountIBAN>
            <xsl:value-of select="px:ChrgsAcct/px:Id/px:IBAN"/>
          </ChargesAccountIBAN>
		  <ChargesAccountOtherIdentification>
			  <xsl:choose>
			    <xsl:when test="px:ChrgsAcct/px:Id/px:BBAN">
				  <xsl:value-of select="px:ChrgsAcct/px:Id/px:BBAN"/>
			    </xsl:when>
			    <xsl:when test="px:ChrgsAcct/px:Id/px:UPIC">
				  <xsl:value-of select="px:ChrgsAcct/px:Id/px:UPIC"/>
			    </xsl:when>
				<xsl:when test="px:ChrgsAcct/px:Id/px:PrtryAcct/px:Id">
				  <xsl:value-of select="px:ChrgsAcct/px:Id/px:PrtryAcct/px:Id"/>
			    </xsl:when>
			  </xsl:choose>
          </ChargesAccountOtherIdentification>
          <ChargesAccountOtherIdNameCode/>
          <ChargesAccountOtherIdIssuer/>
          <ChargesAccountTypeCode>
            <xsl:value-of select="px:ChrgsAcct/px:Tp/px:Cd"/>
          </ChargesAccountTypeCode>
          <ChargesAccountTypeProprietary>
            <xsl:value-of select="px:ChrgsAcct/px:Tp/px:Prtry"/>
          </ChargesAccountTypeProprietary>
          <ChargesAccountCurrency>
            <xsl:value-of select="px:ChrgsAcct/px:Ccy"/>
          </ChargesAccountCurrency>
          <ChargesAccountName>
            <xsl:value-of select="px:ChrgsAcct/px:Nm"/>
          </ChargesAccountName>
          <xsl:for-each select="px:CdtTrfTxInf">
            <Transaction>
              <OrderReference/>
              <InstructionIdentification>
                <xsl:value-of select="px:PmtId/px:InstrId"/>
              </InstructionIdentification>
              <EndToEndIdentification>
                <xsl:value-of select="px:PmtId/px:EndToEndId"/>
              </EndToEndIdentification>
              <PaymentInstructionPriority>
                <xsl:value-of select="px:PmtTpInf/px:InstrPrty"/>
              </PaymentInstructionPriority>
              <PaymentServiceLevelCode>
                <xsl:value-of select="px:PmtTpInf/px:SvcLvl/px:Cd"/>
              </PaymentServiceLevelCode>
              <PaymentServiceLevelProprietary>
                <xsl:value-of select="px:PmtTpInf/px:SvcLvl/px:Prtry"/>
              </PaymentServiceLevelProprietary>
              <PaymentLocalInstrumentCode>
                <xsl:value-of select="px:PmtTpInf/px:LclInstrm/px:Cd"/>
              </PaymentLocalInstrumentCode>
              <PaymentLocalInstrumentProprietary>
                <xsl:value-of select="px:PmtTpInf/px:LclInstrm/px:Prtry"/>
              </PaymentLocalInstrumentProprietary>
              <PaymentCategoryPurposeCode>
                <xsl:value-of select="px:PmtTpInf/px:CtgyPurp"/>
              </PaymentCategoryPurposeCode>
              <PaymentCategoryPurposeProprietary/>
              <InstructedAmount>
                <xsl:value-of select="px:Amt/px:InstdAmt"/>
              </InstructedAmount>
              <InstructedAmountCurrency>
                <xsl:value-of select="px:Amt/px:InstdAmt/@Ccy"/>
              </InstructedAmountCurrency>
              <EquivalentAmount>
                <xsl:value-of select="px:Amt/px:EqvtAmt/px:Amt"/>
              </EquivalentAmount>
              <EquivalentAmountCurrency>
                <xsl:value-of select="px:Amt/px:EqvtAmt/px:Amt/@Ccy"/>
              </EquivalentAmountCurrency>
              <EquivalentAmountCurOfTransfer>
                <xsl:value-of select="px:XchgRateInf/px:XchgRate"/>
              </EquivalentAmountCurOfTransfer>
              <XchgRateInfExchangeRate>
                <xsl:value-of select="px:XchgRateInf/px:XchgRate"/>
              </XchgRateInfExchangeRate>
              <XchgRateInfRateType>
                <xsl:value-of select="px:XchgRateInf/px:RateTp"/>
              </XchgRateInfRateType>
              <XchgRateInfContactInfo>
                <xsl:value-of select="px:XchgRateInf/px:CtrctId"/>
              </XchgRateInfContactInfo>
              <ChargeBearer>
                <xsl:value-of select="px:ChrgBr"/>
              </ChargeBearer>
              <IntermediaryAgent1FinancialInstitution>
                <FinInstBIC>
                  <xsl:value-of select="px:IntrmyAgt1/px:FinInstnId/px:BIC"/>
                </FinInstBIC>
                <FinInstClearingSystemIdentifCode>
                  <xsl:value-of select="px:IntrmyAgt1/px:FinInstnId/px:ClrSysMmbId/px:Id"/>
                </FinInstClearingSystemIdentifCode>
                <FinInstClearingSystemIdentifProprietary>
                  <xsl:value-of select="px:IntrmyAgt1/px:FinInstnId/px:ClrSysMmbId/px:Prtry"/>
                </FinInstClearingSystemIdentifProprietary>
                <FinInstMemberIdentification/>
                <FinInstName>
                  <xsl:value-of select="px:IntrmyAgt1/px:FinInstnId/px:NmAndAdr/px:Nm"/>
                </FinInstName>
                <FinInstPostalAdrAddressType>
                  <xsl:value-of select="px:IntrmyAgt1/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:AdrTp"/>
                </FinInstPostalAdrAddressType>
                <FinInstPostalAdrDepartment/>
                <FinInstPostalAdrSubDepartment/>
                <FinInstPostalAdrStreetName>
                  <xsl:value-of select="px:IntrmyAgt1/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:StrtNm"/>
                </FinInstPostalAdrStreetName>
                <FinInstPostalAdrBuildingNumber>
                  <xsl:value-of select="px:IntrmyAgt1/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:BldgNb"/>
                </FinInstPostalAdrBuildingNumber>
                <FinInstPostalAdrPostCode>
                  <xsl:value-of select="px:IntrmyAgt1/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:PstCd"/>
                </FinInstPostalAdrPostCode>
                <FinInstPostalAdrTownName>
                  <xsl:value-of select="px:IntrmyAgt1/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:TwnNm"/>
                </FinInstPostalAdrTownName>
                <FinInstPostalAdrCountrySubDivision>
                  <xsl:value-of select="px:IntrmyAgt1/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:CtrySubDvsn"/>
                </FinInstPostalAdrCountrySubDivision>
                <FinInstPostalAdrCountry>
                  <xsl:value-of select="px:IntrmyAgt1/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:Ctry"/>
                </FinInstPostalAdrCountry>
                
                <xsl:for-each select="px:IntrmyAgt1/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:AdrLine">
                  <xsl:if test="7&gt;position()">
                    <FinInstPostalAdrAddressLine>
                      <xsl:value-of select="."/>
                    </FinInstPostalAdrAddressLine>
                  </xsl:if>
                </xsl:for-each>
      
                <FinInstOtherIdentification/>
                <FinInstOtherSchemeNameCode/>
                <FinInstIOtherSchemeNameProprietary>
                  <xsl:value-of select="px:IntrmyAgt1/px:FinInstnId/px:PrtryId/px:Id"/>
                </FinInstIOtherSchemeNameProprietary>
                <FinInstOtherIssuer>
                  <xsl:value-of select="px:IntrmyAgt1/px:FinInstnId/px:PrtryId/px:Issr"/>
                </FinInstOtherIssuer>
                <BrnchIdentification>
                  <xsl:value-of select="px:IntrmyAgt1/px:BrnchId/px:Id"/>
                </BrnchIdentification>
                <BrnchIdName>
                  <xsl:value-of select="px:IntrmyAgt1/px:BrnchId/px:Nm"/>
                </BrnchIdName>
                <BrnchPostalAdrAddressType>
                  <xsl:value-of select="px:IntrmyAgt1/px:BrnchId/px:PstlAdr/px:AdrTp"/>
                </BrnchPostalAdrAddressType>
                <BrnchPostalAdrDepartment/>
                <BrnchPostalAdrSubDepartment/>
                <BrnchPostalAdrStreetName>
                  <xsl:value-of select="px:IntrmyAgt1/px:BrnchId/px:PstlAdr/px:StrtNm"/>
                </BrnchPostalAdrStreetName>
                <BrnchPostalAdrBuildingNumber>
                  <xsl:value-of select="px:IntrmyAgt1/px:BrnchId/px:PstlAdr/px:BldgNb"/>
                </BrnchPostalAdrBuildingNumber>
                <BrnchPostalAdrPostCode>
                  <xsl:value-of select="px:IntrmyAgt1/px:BrnchId/px:PstlAdr/px:PstCd"/>
                </BrnchPostalAdrPostCode>
                <BrnchPostalAdrTownName>
                  <xsl:value-of select="px:IntrmyAgt1/px:BrnchId/px:PstlAdr/px:TwnNm"/>
                </BrnchPostalAdrTownName>
                <BrnchPostalAdrCountrySubDivision>
                  <xsl:value-of select="px:IntrmyAgt1/px:BrnchId/px:PstlAdr/px:CtrySubDvsn"/>
                </BrnchPostalAdrCountrySubDivision>
                <BrnchPostalAdrCountry>
                  <xsl:value-of select="px:IntrmyAgt1/px:BrnchId/px:PstlAdr/px:Ctry"/>
                </BrnchPostalAdrCountry>
                
                <xsl:for-each select="px:IntrmyAgt1/px:BrnchId/px:PstlAdr/px:AdrLine">
                  <xsl:if test="7&gt;position()">
                    <BrnchPostalAdrAddressLine>
                      <xsl:value-of select="."/>
                    </BrnchPostalAdrAddressLine>
                  </xsl:if>
                </xsl:for-each>
                
              </IntermediaryAgent1FinancialInstitution>
              <CreditorAgentFinancialInstitution>
                <FinInstBIC>
					<xsl:choose>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:BIC">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:BIC"/>
					</xsl:when>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:BIC">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:BIC"/>
					</xsl:when>
					</xsl:choose>
                </FinInstBIC>
                <FinInstClearingSystemIdentifCode>
					<xsl:choose>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:ClrSysMmbId/px:Id">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:ClrSysMmbId/px:Id"/>
					</xsl:when>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:ClrSysMmbId/px:Id">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:ClrSysMmbId/px:Id"/>
					</xsl:when>
					</xsl:choose>				
                </FinInstClearingSystemIdentifCode>
                <FinInstClearingSystemIdentifProprietary>
					<xsl:choose>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:ClrSysMmbId/px:Prtry">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:ClrSysMmbId/px:Prtry"/>
					</xsl:when>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:ClrSysMmbId/px:Prtry">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:ClrSysMmbId/px:Prtry"/>
					</xsl:when>
					</xsl:choose>					  
                </FinInstClearingSystemIdentifProprietary>
                <FinInstMemberIdentification/>
                <FinInstName>
					<xsl:choose>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:NmAndAdr/px:Nm">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:NmAndAdr/px:Nm"/>
					</xsl:when>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:Nm">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:Nm"/>
					</xsl:when>
					</xsl:choose>					  
                </FinInstName>
                <FinInstPostalAdrAddressType>
					<xsl:choose>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:AdrTp">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:AdrTp"/>
					</xsl:when>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:AdrTp">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:AdrTp"/>
					</xsl:when>
					</xsl:choose>					  
                </FinInstPostalAdrAddressType>
                <FinInstPostalAdrDepartment/>
                <FinInstPostalAdrSubDepartment/>
                <FinInstPostalAdrStreetName>
					<xsl:choose>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:StrtNm">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:StrtNm"/>
					</xsl:when>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:StrtNm">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:StrtNm"/>
					</xsl:when>
					</xsl:choose>				  
                </FinInstPostalAdrStreetName>
                <FinInstPostalAdrBuildingNumber>
					<xsl:choose>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:BldgNb">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:BldgNb"/>
					</xsl:when>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:BldgNb">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:BldgNb"/>
					</xsl:when>
					</xsl:choose>					  
                </FinInstPostalAdrBuildingNumber>
                <FinInstPostalAdrPostCode>
					<xsl:choose>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:PstCd">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:PstCd"/>
					</xsl:when>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:PstCd">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:PstCd"/>
					</xsl:when>
					</xsl:choose>
                </FinInstPostalAdrPostCode>
                <FinInstPostalAdrTownName>
					<xsl:choose>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:TwnNm">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:TwnNm"/>
					</xsl:when>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:TwnNm">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:TwnNm"/>
					</xsl:when>
					</xsl:choose>
                </FinInstPostalAdrTownName>
                <FinInstPostalAdrCountrySubDivision>
					<xsl:choose>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:CtrySubDvsn">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:CtrySubDvsn"/>
					</xsl:when>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:CtrySubDvsn">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:CtrySubDvsn"/>
					</xsl:when>
					</xsl:choose>				  
                </FinInstPostalAdrCountrySubDivision>
                <FinInstPostalAdrCountry>
					<xsl:choose>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:Ctry">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:Ctry"/>
					</xsl:when>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:Ctry">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:PstlAdr/px:Ctry"/>
					</xsl:when>
					</xsl:choose>					  
                </FinInstPostalAdrCountry>
                
          <xsl:for-each select="px:CdtrAgt/px:FinInstnId/px:NmAndAdr/px:PstlAdr/px:AdrLine">
            <xsl:if test="7&gt;position()">
              <FinInstPostalAdrAddressLine>
                <xsl:value-of select="."/>
              </FinInstPostalAdrAddressLine>
            </xsl:if>
          </xsl:for-each>
                
                <FinInstOtherIdentification>
					<xsl:choose>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:PrtryId/px:Id">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:PrtryId/px:Id"/>
					</xsl:when>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:PrtryId/px:Id">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:PrtryId/px:Id"/>
					</xsl:when>
					</xsl:choose>						  
                </FinInstOtherIdentification>
                <FinInstOtherSchemeNameCode/>
                <FinInstIOtherSchemeNameProprietary/>
                <FinInstOtherIssuer>
					<xsl:choose>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:PrtryId/px:Issr">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:PrtryId/px:Issr"/>
					</xsl:when>
					<xsl:when test="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:PrtryId/px:Issr">
					  <xsl:value-of select="px:CdtrAgt/px:FinInstnId/px:CmbndId/px:PrtryId/px:Issr"/>
					</xsl:when>
					</xsl:choose>					  
                </FinInstOtherIssuer>
                <BrnchIdentification>
                  <xsl:value-of select="px:CdtrAgt/px:BrnchId/px:Id"/>
                </BrnchIdentification>
                <BrnchIdName>
                  <xsl:value-of select="px:CdtrAgt/px:BrnchId/px:Nm"/>
                </BrnchIdName>
                <BrnchPostalAdrAddressType>
                  <xsl:value-of select="px:CdtrAgt/px:BrnchId/px:PstlAdr/px:AdrTp"/>
                </BrnchPostalAdrAddressType>
                <BrnchPostalAdrDepartment/>
                <BrnchPostalAdrSubDepartment/>
                <BrnchPostalAdrStreetName>
                  <xsl:value-of select="px:CdtrAgt/px:BrnchId/px:PstlAdr/px:StrtNm"/>
                </BrnchPostalAdrStreetName>
                <BrnchPostalAdrBuildingNumber>
                  <xsl:value-of select="px:CdtrAgt/px:BrnchId/px:PstlAdr/px:BldgNb"/>
                </BrnchPostalAdrBuildingNumber>
                <BrnchPostalAdrPostCode>
                  <xsl:value-of select="px:CdtrAgt/px:BrnchId/px:PstlAdr/px:PstCd"/>
                </BrnchPostalAdrPostCode>
                <BrnchPostalAdrTownName>
                  <xsl:value-of select="px:CdtrAgt/px:BrnchId/px:PstlAdr/px:TwnNm"/>
                </BrnchPostalAdrTownName>
                <BrnchPostalAdrCountrySubDivision>
                  <xsl:value-of select="px:CdtrAgt/px:BrnchId/px:PstlAdr/px:CtrySubDvsn"/>
                </BrnchPostalAdrCountrySubDivision>
                <BrnchPostalAdrCountry>
                  <xsl:value-of select="px:CdtrAgt/px:BrnchId/px:PstlAdr/px:Ctry"/>
                </BrnchPostalAdrCountry>
                
              <xsl:for-each select="px:CdtrAgt/px:BrnchId/px:PstlAdr/px:AdrLine">
                <xsl:if test="7&gt;position()">
                  <BrnchPostalAdrAddressLine>
                    <xsl:value-of select="."/>
                  </BrnchPostalAdrAddressLine>
                </xsl:if>
              </xsl:for-each>

              </CreditorAgentFinancialInstitution>
              <CreditorPartyIdentification>
                <Name>
                  <xsl:value-of select="px:Cdtr/px:Nm"/>
                </Name>
                <PostalAdrAddressType>
                  <xsl:value-of select="px:Cdtr/px:PstlAdr/px:AdrTp"/>
                </PostalAdrAddressType>
                <PostalAdrDepartment/>
                <PostalAdrSubDepartment/>
                <PostalAdrStreetName>
                  <xsl:value-of select="px:Cdtr/px:PstlAdr/px:StrtNm"/>
                </PostalAdrStreetName>
                <PostalAdrBuildingNumber>
                  <xsl:value-of select="px:Cdtr/px:PstlAdr/px:BldgNb"/>
                </PostalAdrBuildingNumber>
                <PostalAdrPostCode>
                  <xsl:value-of select="px:Cdtr/px:PstlAdr/px:PstCd"/>
                </PostalAdrPostCode>
                <PostalAdrTownName>
                  <xsl:value-of select="px:Cdtr/px:PstlAdr/px:TwnNm"/>
                </PostalAdrTownName>
                <PostalAdrCountrySubDivision>
                  <xsl:value-of select="px:Cdtr/px:PstlAdr/px:CtrySubDvsn"/>
                </PostalAdrCountrySubDivision>
                <PostalAdrCountryCode>
                  <xsl:value-of select="px:Cdtr/px:PstlAdr/px:Ctry"/>
                </PostalAdrCountryCode>
                
              <xsl:for-each select="px:Cdtr/px:PstlAdr/px:AdrLine">
                <xsl:if test="7&gt;position()">
                  <PostalAdrAddressLine>
                    <xsl:value-of select="."/>
                  </PostalAdrAddressLine>
                </xsl:if>
              </xsl:for-each>
              
				<OrgIdentBIC>
				<xsl:choose>
				  <xsl:when test="px:Cdtr/px:Id/px:OrgId/px:BIC">
					<xsl:value-of select="px:Cdtr/px:Id/px:OrgId/px:BIC"/>
				  </xsl:when>
				  <xsl:when test="px:Cdtr/px:Id/px:OrgId/px:IBEI">
					<xsl:value-of select="px:Cdtr/px:Id/px:OrgId/px:IBEI"/>
				  </xsl:when>
				  <xsl:when test="px:Cdtr/px:Id/px:OrgId/px:BEI">
					<xsl:value-of select="px:Cdtr/px:Id/px:OrgId/px:BEI"/>
				  </xsl:when>		  
				  </xsl:choose>
				</OrgIdentBIC>
				<OrganisIdentOtherIdentification>
				<xsl:choose>
				  <xsl:when test="px:Cdtr/px:Id/px:OrgId/px:EANGLN">
					<xsl:value-of select="px:Cdtr/px:Id/px:OrgId/px:EANGLN"/>
				  </xsl:when>
				  <xsl:when test="px:Cdtr/px:Id/px:OrgId/px:USCHU">
					<xsl:value-of select="px:Cdtr/px:Id/px:OrgId/px:USCHU"/>
				  </xsl:when>
				  <xsl:when test="px:Cdtr/px:Id/px:OrgId/px:DUNS">
					<xsl:value-of select="px:Cdtr/px:Id/px:OrgId/px:DUNS"/>
				  </xsl:when>
				  <xsl:when test="px:Cdtr/px:Id/px:OrgId/px:BkPtyId">
					<xsl:value-of select="px:Cdtr/px:Id/px:OrgId/px:BkPtyId"/>
				  </xsl:when>
				  <xsl:when test="px:Cdtr/px:Id/px:OrgId/px:TaxIdNb">
					<xsl:value-of select="px:Cdtr/px:Id/px:OrgId/px:TaxIdNb"/>
				  </xsl:when>		  
				  </xsl:choose>
				</OrganisIdentOtherIdentification>
                <OrganisIdentOtherCode/>
                <OrganisIdentOtherProprietary>
                  <xsl:value-of select="px:Cdtr/px:Id/px:OrgId/px:PrtryId/px:Id"/>
                </OrganisIdentOtherProprietary>
                <OrganisIdentOtherIssuer>
                  <xsl:value-of select="px:Cdtr/px:Id/px:OrgId/px:PrtryId/px:Issr"/>
                </OrganisIdentOtherIssuer>
                <PrivateIdentBirthDate>
                  <xsl:value-of select="px:Cdtr/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:BirthDt"/>
                </PrivateIdentBirthDate>
                <PrivateIdentProvinceOfBirth>
                  <xsl:value-of select="px:Cdtr/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:PrvcOfBirth"/>
                </PrivateIdentProvinceOfBirth>
                <PrivateIdentCityOfBirth>
                  <xsl:value-of select="px:Cdtr/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:CityOfBirth"/>
                </PrivateIdentCityOfBirth>
                <PrivateIdentCountryOfBirth>
                  <xsl:value-of select="px:Cdtr/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:CtryOfBirth"/>
                </PrivateIdentCountryOfBirth>
                <OtherPersonIdentification>
                  <PrivateIdentOtherIdentification>
                    <xsl:value-of select="px:Cdtr/px:Id/px:PrvtId/px:OthrId/px:Id"/>
                  </PrivateIdentOtherIdentification>
                  <PrivateIdentOtherCode/>
                  <PrivateIdentOtherProprietary/>
                  <PrivateIdentOtherIssuer>
                    <xsl:value-of select="px:Cdtr/px:Id/px:PrvtId/px:Issr"/>
                  </PrivateIdentOtherIssuer>
                </OtherPersonIdentification>
                <CountryOfResidence>
                  <xsl:value-of select="px:Cdtr/px:CtryOfRes"/>
                </CountryOfResidence>
                <ContactDetailsNamePrefix/>
                <ContactDetailsName/>
                <ContactDetailsPhoneNumber/>
                <ContactDetailsMobileNumber/>
                <ContactDetailsFaxNumber/>
                <ContactDetailsEmailAddress/>
                <ContactDetailsOther/>
              </CreditorPartyIdentification>
              <CreditorAccountIBAN>
                <xsl:value-of select="px:CdtrAcct/px:Id/px:IBAN"/>
              </CreditorAccountIBAN>
			  <CreditorAccountOtherIdentification>
			  <xsl:choose>
			    <xsl:when test="px:CdtrAcct/px:Id/px:BBAN">
				  <xsl:value-of select="px:CdtrAcct/px:Id/px:BBAN"/>
			    </xsl:when>
			    <xsl:when test="px:CdtrAcct/px:Id/px:UPIC">
				  <xsl:value-of select="px:CdtrAcct/px:Id/px:UPIC"/>
			    </xsl:when>
				<xsl:when test="px:CdtrAcct/px:Id/px:PrtryAcct/px:Id">
				  <xsl:value-of select="px:CdtrAcct/px:Id/px:PrtryAcct/px:Id"/>
			    </xsl:when>
			  </xsl:choose>
			  </CreditorAccountOtherIdentification>			  
              <CreditorAccountOtherIdNameCode/>
              <CreditorAccountOtherIdIssuer/>
              <CreditorAccountTypeCode>
                <xsl:value-of select="px:CdtrAcct/px:Tp/px:Cd"/>
              </CreditorAccountTypeCode>
              <CreditorAccountTypeProprietary>
                <xsl:value-of select="px:CdtrAcct/px:Tp/px:Prtry"/>
              </CreditorAccountTypeProprietary>
              <CreditorAccountCurrency>
                <xsl:value-of select="px:CdtrAcct/px:Ccy"/>
              </CreditorAccountCurrency>
              <CreditorAccountName>
                <xsl:value-of select="px:CdtrAcct/px:Nm"/>
              </CreditorAccountName>
              <UltimateCreditorPartyIdentification>
                <Name>
                  <xsl:value-of select="px:UltmtCdtr/px:Nm"/>
                </Name>
                <PostalAdrAddressType>
                  <xsl:value-of select="px:UltmtCdtr/px:PstlAdr/px:AdrTp"/>
                </PostalAdrAddressType>
                <PostalAdrDepartment/>
                <PostalAdrSubDepartment/>
                <PostalAdrStreetName>
                  <xsl:value-of select="px:UltmtCdtr/px:PstlAdr/px:StrtNm"/>
                </PostalAdrStreetName>
                <PostalAdrBuildingNumber>
                  <xsl:value-of select="px:UltmtCdtr/px:PstlAdr/px:BldgNb"/>
                </PostalAdrBuildingNumber>
                <PostalAdrPostCode>
                  <xsl:value-of select="px:UltmtCdtr/px:PstlAdr/px:PstCd"/>
                </PostalAdrPostCode>
                <PostalAdrTownName>
                  <xsl:value-of select="px:UltmtCdtr/px:PstlAdr/px:TwnNm"/>
                </PostalAdrTownName>
                <PostalAdrCountrySubDivision>
                  <xsl:value-of select="px:UltmtCdtr/px:PstlAdr/px:CtrySubDvsn"/>
                </PostalAdrCountrySubDivision>
                <PostalAdrCountryCode>
                  <xsl:value-of select="px:UltmtCdtr/px:PstlAdr/px:Ctry"/>
                </PostalAdrCountryCode>
                
              <xsl:for-each select="px:UltmtCdtr/px:PstlAdr/px:AdrLine">
                <xsl:if test="7&gt;position()">
                  <PostalAdrAddressLine>
                    <xsl:value-of select="."/>
                  </PostalAdrAddressLine>
                </xsl:if>
              </xsl:for-each>
              
				<OrgIdentBIC>
				<xsl:choose>
				  <xsl:when test="px:UltmtCdtr/px:Id/px:OrgId/px:BIC">
					<xsl:value-of select="px:UltmtCdtr/px:Id/px:OrgId/px:BIC"/>
				  </xsl:when>
				  <xsl:when test="px:UltmtCdtr/px:Id/px:OrgId/px:IBEI">
					<xsl:value-of select="px:UltmtCdtr/px:Id/px:OrgId/px:IBEI"/>
				  </xsl:when>
				  <xsl:when test="px:UltmtCdtr/px:Id/px:OrgId/px:BEI">
					<xsl:value-of select="px:UltmtCdtr/px:Id/px:OrgId/px:BEI"/>
				  </xsl:when>		  
				  </xsl:choose>
				</OrgIdentBIC>
				<OrganisIdentOtherIdentification>
				<xsl:choose>
				  <xsl:when test="px:UltmtCdtr/px:Id/px:OrgId/px:EANGLN">
					<xsl:value-of select="px:UltmtCdtr/px:Id/px:OrgId/px:EANGLN"/>
				  </xsl:when>
				  <xsl:when test="px:UltmtCdtr/px:Id/px:OrgId/px:USCHU">
					<xsl:value-of select="px:UltmtCdtr/px:Id/px:OrgId/px:USCHU"/>
				  </xsl:when>
				  <xsl:when test="px:UltmtCdtr/px:Id/px:OrgId/px:DUNS">
					<xsl:value-of select="px:UltmtCdtr/px:Id/px:OrgId/px:DUNS"/>
				  </xsl:when>
				  <xsl:when test="px:UltmtCdtr/px:Id/px:OrgId/px:BkPtyId">
					<xsl:value-of select="px:UltmtCdtr/px:Id/px:OrgId/px:BkPtyId"/>
				  </xsl:when>
				  <xsl:when test="px:UltmtCdtr/px:Id/px:OrgId/px:TaxIdNb">
					<xsl:value-of select="px:UltmtCdtr/px:Id/px:OrgId/px:TaxIdNb"/>
				  </xsl:when>		  
				  </xsl:choose>
				</OrganisIdentOtherIdentification>
                <OrganisIdentOtherCode/>
                <OrganisIdentOtherProprietary>
                  <xsl:value-of select="px:UltmtCdtr/px:Id/px:OrgId/px:PrtryId/px:Id"/>
                </OrganisIdentOtherProprietary>
                <OrganisIdentOtherIssuer>
                  <xsl:value-of select="px:UltmtCdtr/px:Id/px:OrgId/px:PrtryId/px:Issr"/>
                </OrganisIdentOtherIssuer>
                <PrivateIdentBirthDate>
                  <xsl:value-of select="px:UltmtCdtr/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:BirthDt"/>
                </PrivateIdentBirthDate>
                <PrivateIdentProvinceOfBirth>
                  <xsl:value-of select="px:UltmtCdtr/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:PrvcOfBirth"/>
                </PrivateIdentProvinceOfBirth>
                <PrivateIdentCityOfBirth>
                  <xsl:value-of select="px:UltmtCdtr/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:CityOfBirth"/>
                </PrivateIdentCityOfBirth>
                <PrivateIdentCountryOfBirth>
                  <xsl:value-of select="px:UltmtCdtr/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:CtryOfBirth"/>
                </PrivateIdentCountryOfBirth>
                <OtherPersonIdentification>
                  <PrivateIdentOtherIdentification>
                    <xsl:value-of select="px:UltmtCdtr/px:Id/px:PrvtId/px:OthrId/px:Id"/>
                  </PrivateIdentOtherIdentification>
                  <PrivateIdentOtherCode/>
                  <PrivateIdentOtherProprietary/>
                  <PrivateIdentOtherIssuer>
                    <xsl:value-of select="px:UltmtCdtr/px:Id/px:PrvtId/px:Issr"/>
                  </PrivateIdentOtherIssuer>
                </OtherPersonIdentification>
                <CountryOfResidence>
                  <xsl:value-of select="px:UltmtCdtr/px:CtryOfRes"/>
                </CountryOfResidence>
                <ContactDetailsNamePrefix/>
                <ContactDetailsName/>
                <ContactDetailsPhoneNumber/>
                <ContactDetailsMobileNumber/>
                <ContactDetailsFaxNumber/>
                <ContactDetailsEmailAddress/>
                <ContactDetailsOther/>
              </UltimateCreditorPartyIdentification>
              <xsl:for-each select="px:InstrForCdtrAgt">
                <InstructionForCreditorAgent>
                  <Code>
                    <xsl:value-of select="px:Cd"/>
                  </Code>
                  <InstructionInformation>
                    <xsl:value-of select="px:InstrInf"/>
                  </InstructionInformation>
                </InstructionForCreditorAgent>
              </xsl:for-each>
              <PurposeCode>
                <xsl:value-of select="px:Purp/px:Cd"/>
              </PurposeCode>
              <PurposeProprietary>
                <xsl:value-of select="px:Purp/px:Prtry"/>
              </PurposeProprietary>
              <xsl:for-each select="px:RgltryRptg">
                <xsl:if test="10&gt;position()">
                  <RegulatoryReporting>
                    <DebitCreditReportingIndicator>
                      <xsl:value-of select="px:DbtCdtRptgInd"/>
                    </DebitCreditReportingIndicator>
                    <AuthorityName>
                      <xsl:value-of select="px:Authrty/px:AuthrtyNm"/>
                    </AuthorityName>
                    <AuthorityCountry>
                      <xsl:value-of select="px:Authrty/px:AuthrtyCtry"/>
                    </AuthorityCountry>
                    <Details>
                      <Type/>
                      <Date/>
                      <Country/>
                      <Code>
                        <xsl:value-of select="px:RgltryDtls/px:Cd"/>
                      </Code>
                      <Amount>
                        <xsl:value-of select="px:RgltryDtls/px:Amt"/>
                      </Amount>
                      <Currency>
                        <xsl:value-of select="px:RgltryDtls/px:Amt/@Ccy"/>
                      </Currency>
                      <Information>
                        <Information>
                          <xsl:value-of select="px:RgltryDtls/px:Inf"/>
                        </Information>
                      </Information>
                    </Details>
                  </RegulatoryReporting>
                </xsl:if>
              </xsl:for-each>
              <Tax>
                <CreditorTaxIdentification>
                  <xsl:value-of select="px:Tax/px:CdtrTaxId"/>
                </CreditorTaxIdentification>
                <CreditorRegistrationIdentification/>
                <CreditorTaxType>
                  <xsl:value-of select="px:Tax/px:CdtrTaxTp"/>
                </CreditorTaxType>
                <DebtorTaxIdentification>
                  <xsl:value-of select="px:Tax/px:DbtrTaxId"/>
                </DebtorTaxIdentification>
                <DebtorRegistrationIdentification/>
                <DebtorTaxType/>
                <DebtorAuthorisationTitle/>
                <DebtorAuthorisationName/>
                <AdministrationZone/>
                <ReferenceNumber>
                  <xsl:value-of select="px:Tax/px:TaxRefNb"/>
                </ReferenceNumber>
                <Method/>
                <TotalTaxableBaseAmount>
                  <xsl:value-of select="px:Tax/px:TtlTaxblBaseAmt"/>
                </TotalTaxableBaseAmount>
                <TotalTaxableBaseAmountCurrency>
                  <xsl:value-of select="px:Tax/px:TtlTaxblBaseAmt/@Ccy"/>
                </TotalTaxableBaseAmountCurrency>
                <TotalTaxAmount>
                  <xsl:value-of select="px:Tax/px:TtlTaxAmt"/>
                </TotalTaxAmount>
                <TotalTaxAmountCurrency>
                  <xsl:value-of select="px:Tax/px:TtlTaxAmt/@Ccy"/>
                </TotalTaxAmountCurrency>
                <Date>
                  <xsl:value-of select="px:Tax/px:TaxDt"/>
                </Date>
                <SequenceNumber/>
                <xsl:for-each select="px:Tax/px:TaxTpInf">
                  <TaxRecord>
                    <Type/>
                    <Category/>
                    <CategoryDetails/>
                    <DebtorStatus/>
                    <CertificateIdentification>
                      <xsl:value-of select="px:CertId"/>
                    </CertificateIdentification>
                    <FormsCode/>
                    <PeriodYear/>
                    <PeriodType/>
                    <PeriodFromDate/>
                    <PeriodToDate/>
                    <TaxAmountRate>
                      <xsl:value-of select="px:TaxTp/px:Rate"/>
                    </TaxAmountRate>
                    <TaxableBaseAmount>
                      <xsl:value-of select="px:TaxTp/px:TaxblBaseAmt"/>
                    </TaxableBaseAmount>
                    <TaxableBaseAmountCurrency>
                      <xsl:value-of select="px:TaxTp/px:TaxblBaseAmt/@Ccy"/>
                    </TaxableBaseAmountCurrency>
                    <TotalAmount>
                      <xsl:value-of select="px:TaxTp/px:Amt"/>
                    </TotalAmount>
                    <TotalAmountCurrency>
                      <xsl:value-of select="px:TaxTp/px:Amt/@Ccy"/>
                    </TotalAmountCurrency>
                    <TaxAmountDetails>
                      <PeriodYear/>
                      <PeriodType/>
                      <FromDate/>
                      <ToDate/>
                      <Amount/>
                      <Currency/>
                    </TaxAmountDetails>
                    <AdditionalInformation/>
                  </TaxRecord>
                </xsl:for-each>
              </Tax>
              <RemittanceInformation>
                <xsl:for-each select="px:RmtInf/px:Ustrd">
                  <Unstructured>
                    <xsl:value-of select="."/>
                  </Unstructured>
                </xsl:for-each>
                <xsl:for-each select="px:RmtInf/px:Strd">
                  <RemitReferredDocInfo>
                    <TypeCode>
                      <xsl:value-of select="px:RfrdDocInf/px:RfrdDocTp/px:Cd"/>
                    </TypeCode>
                    <TypeProprietary>
                      <xsl:value-of select="px:RfrdDocInf/px:RfrdDocTp/px:Prtry"/>
                    </TypeProprietary>
                    <TypeIssuer>
                      <xsl:value-of select="px:RfrdDocInf/px:RfrdDocTp/px:Issr"/>
                    </TypeIssuer>
                    <Number>
                      <xsl:value-of select="px:RfrdDocInf/px:RfrdDocNb"/>
                    </Number>
                    <RelatedDate>
                      <xsl:value-of select="px:RfrdDocRltdDt"/>
                    </RelatedDate>
                  </RemitReferredDocInfo>
                </xsl:for-each>
                <ReferredDocAmountDuePayableAmount>
                  <xsl:value-of select="px:RmtInf/px:Strd/px:RfrdDocAmt/px:DuePyblAmt"/>
                </ReferredDocAmountDuePayableAmount>
                <ReferredDocAmountDuePayableCurrency>
                  <xsl:value-of select="px:RmtInf/px:Strd/px:RfrdDocAmt/px:DuePyblAmt/@Ccy"/>
                </ReferredDocAmountDuePayableCurrency>
                <xsl:for-each select="px:RmtInf/px:Strd/px:RfrdDocAmt">
                  <ReferredDocDiscountAppliedAmount>
                    <Code/>
                    <Proprietary/>
                    <Amount>
                      <xsl:value-of select="px:DscntApldAmt"/>
                    </Amount>
                    <Currency>
                      <xsl:value-of select="px:DscntApldAmt/@Ccy"/>
                    </Currency>
                  </ReferredDocDiscountAppliedAmount>
                </xsl:for-each>
                <ReferredDocAmountCreditNoteAmount>
                  <xsl:value-of select="px:RmtInf/px:Strd/px:RfrdDocAmt/px:CdtNoteAmt"/>
                </ReferredDocAmountCreditNoteAmount>
                <ReferredDocAmountCreditNoteCurrency>
                  <xsl:value-of select="px:RmtInf/px:Strd/px:RfrdDocAmt/px:CdtNoteAmt/@Ccy"/>
                </ReferredDocAmountCreditNoteCurrency>
                <xsl:for-each select="px:RmtInf/px:Strd/px:RfrdDocAmt">
                  <ReferredDocTaxAmount>
                    <Code/>
                    <Proprietary/>
                    <Amount>
                      <xsl:value-of select="px:TaxAmt"/>
                    </Amount>
                    <Currency>
                      <xsl:value-of select="px:TaxAmt/@Ccy"/>
                    </Currency>
                  </ReferredDocTaxAmount>
                </xsl:for-each>
                <PayRemitAdjustmentAmountAndReason>
                  <Amount/>
                  <Currency/>
                  <CreditDebitIndicator/>
                  <Reason/>
                  <AdditionalInformation/>
                </PayRemitAdjustmentAmountAndReason>
                <ReferredDocAmountRemittedAmount>
                  <xsl:value-of select="px:RmtInf/px:Strd/px:RfrdDocAmt/px:RmtdAmt"/>
                </ReferredDocAmountRemittedAmount>
                <ReferredDocAmountRemittedCurrency>
                  <xsl:value-of select="px:RmtInf/px:Strd/px:RfrdDocAmt/px:RmtdAmt/@Ccy"/>
                </ReferredDocAmountRemittedCurrency>
                <CreditorReferenceInformationCode>
                  <xsl:value-of select="px:RmtInf/px:Strd/px:CdtrRefInf/px:CdtrRefTp/px:Cd"/>
                </CreditorReferenceInformationCode>
                <CreditorReferenceInformationProprietary>
                  <xsl:value-of select="px:RmtInf/px:Strd/px:CdtrRefInf/px:CdtrRefTp/px:Prtry"/>
                </CreditorReferenceInformationProprietary>
                <CreditorReferenceInformationIssuer>
                  <xsl:value-of select="px:RmtInf/px:Strd/px:CdtrRefInf/px:CdtrRefTp/px:Issr"/>
                </CreditorReferenceInformationIssuer>
                <CreditorReferenceInformationReference>
                  <xsl:value-of select="px:RmtInf/px:Strd/px:CdtrRefInf/px:CdtrRef"/>
                </CreditorReferenceInformationReference>
                <InvoicerPartyIdentification>
                  <Name>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:Nm"/>
                  </Name>
                  <PostalAdrAddressType>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:PstlAdr/px:AdrTp"/>
                  </PostalAdrAddressType>
                  <PostalAdrDepartment/>
                  <PostalAdrSubDepartment/>
                  <PostalAdrStreetName>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:PstlAdr/px:StrtNm"/>
                  </PostalAdrStreetName>
                  <PostalAdrBuildingNumber>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:PstlAdr/px:BldgNb"/>
                  </PostalAdrBuildingNumber>
                  <PostalAdrPostCode>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:PstlAdr/px:PstCd"/>
                  </PostalAdrPostCode>
                  <PostalAdrTownName>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:PstlAdr/px:TwnNm"/>
                  </PostalAdrTownName>
                  <PostalAdrCountrySubDivision>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:PstlAdr/px:CtrySubDvsn"/>
                  </PostalAdrCountrySubDivision>
                  <PostalAdrCountryCode>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:PstlAdr/px:Ctry"/>
                  </PostalAdrCountryCode>
                  
              <xsl:for-each select="px:RmtInf/px:Strd/px:Invcr/px:PstlAdr/px:AdrLine">
                <xsl:if test="7&gt;position()">
                  <PostalAdrAddressLine>
                    <xsl:value-of select="."/>
                  </PostalAdrAddressLine>
                </xsl:if>
              </xsl:for-each>
              
				<OrgIdentBIC>
				<xsl:choose>
				  <xsl:when test="px:RmtInf/px:Strd/px:Invcr/px:Id/px:OrgId/px:BIC">
					<xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:Id/px:OrgId/px:BIC"/>
				  </xsl:when>
				  <xsl:when test="px:RmtInf/px:Strd/px:Invcr/px:Id/px:OrgId/px:IBEI">
					<xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:Id/px:OrgId/px:IBEI"/>
				  </xsl:when>
				  <xsl:when test="px:RmtInf/px:Strd/px:Invcr/px:Id/px:OrgId/px:BEI">
					<xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:Id/px:OrgId/px:BEI"/>
				  </xsl:when>		  
				  </xsl:choose>
				</OrgIdentBIC>
				<OrganisIdentOtherIdentification>
				<xsl:choose>
				  <xsl:when test="px:RmtInf/px:Strd/px:Invcr/px:Id/px:OrgId/px:EANGLN">
					<xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:Id/px:OrgId/px:EANGLN"/>
				  </xsl:when>
				  <xsl:when test="px:RmtInf/px:Strd/px:Invcr/px:Id/px:OrgId/px:USCHU">
					<xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:Id/px:OrgId/px:USCHU"/>
				  </xsl:when>
				  <xsl:when test="px:RmtInf/px:Strd/px:Invcr/px:Id/px:OrgId/px:DUNS">
					<xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:Id/px:OrgId/px:DUNS"/>
				  </xsl:when>
				  <xsl:when test="px:RmtInf/px:Strd/px:Invcr/px:Id/px:OrgId/px:BkPtyId">
					<xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:Id/px:OrgId/px:BkPtyId"/>
				  </xsl:when>
				  <xsl:when test="px:RmtInf/px:Strd/px:Invcr/px:Id/px:OrgId/px:TaxIdNb">
					<xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:Id/px:OrgId/px:TaxIdNb"/>
				  </xsl:when>		  
				  </xsl:choose>
				</OrganisIdentOtherIdentification>
                  <OrganisIdentOtherCode/>
                  <OrganisIdentOtherProprietary>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:Id/px:OrgId/px:PrtryId/px:Id"/>
                  </OrganisIdentOtherProprietary>
                  <OrganisIdentOtherIssuer>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:Id/px:OrgId/px:PrtryId/px:Issr"/>
                  </OrganisIdentOtherIssuer>
                  <PrivateIdentBirthDate>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:BirthDt"/>
                  </PrivateIdentBirthDate>
                  <PrivateIdentProvinceOfBirth>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:PrvcOfBirth"/>
                  </PrivateIdentProvinceOfBirth>
                  <PrivateIdentCityOfBirth>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:CityOfBirth"/>
                  </PrivateIdentCityOfBirth>
                  <PrivateIdentCountryOfBirth>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:CtryOfBirth"/>
                  </PrivateIdentCountryOfBirth>
                  <OtherPersonIdentification>
                    <PrivateIdentOtherIdentification>
                      <xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:Id/px:PrvtId/px:OthrId/px:Id"/>
                    </PrivateIdentOtherIdentification>
                    <PrivateIdentOtherCode/>
                    <PrivateIdentOtherProprietary/>
                    <PrivateIdentOtherIssuer>
                      <xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:Id/px:PrvtId/px:Issr"/>
                    </PrivateIdentOtherIssuer>
                  </OtherPersonIdentification>
                  <CountryOfResidence>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcr/px:CtryOfRes"/>
                  </CountryOfResidence>
                  <ContactDetailsNamePrefix/>
                  <ContactDetailsName/>
                  <ContactDetailsPhoneNumber/>
                  <ContactDetailsMobileNumber/>
                  <ContactDetailsFaxNumber/>
                  <ContactDetailsEmailAddress/>
                  <ContactDetailsOther/>
                </InvoicerPartyIdentification>
                <InvoiceePartyIdentification>
                  <Name>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:Nm"/>
                  </Name>
                  <PostalAdrAddressType>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:PstlAdr/px:AdrTp"/>
                  </PostalAdrAddressType>
                  <PostalAdrDepartment/>
                  <PostalAdrSubDepartment/>
                  <PostalAdrStreetName>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:PstlAdr/px:StrtNm"/>
                  </PostalAdrStreetName>
                  <PostalAdrBuildingNumber>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:PstlAdr/px:BldgNb"/>
                  </PostalAdrBuildingNumber>
                  <PostalAdrPostCode>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:PstlAdr/px:PstCd"/>
                  </PostalAdrPostCode>
                  <PostalAdrTownName>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:PstlAdr/px:TwnNm"/>
                  </PostalAdrTownName>
                  <PostalAdrCountrySubDivision>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:PstlAdr/px:CtrySubDvsn"/>
                  </PostalAdrCountrySubDivision>
                  <PostalAdrCountryCode>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:PstlAdr/px:Ctry"/>
                  </PostalAdrCountryCode>
                  
                <xsl:for-each select="px:RmtInf/px:Strd/px:Invcee/px:PstlAdr/px:AdrLine">
                  <xsl:if test="7&gt;position()">
                    <PostalAdrAddressLine>
                      <xsl:value-of select="."/>
                    </PostalAdrAddressLine>
                  </xsl:if>
                </xsl:for-each>
              
				<OrgIdentBIC>
				<xsl:choose>
				  <xsl:when test="px:RmtInf/px:Strd/px:Invcee/px:Id/px:OrgId/px:BIC">
					<xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:Id/px:OrgId/px:BIC"/>
				  </xsl:when>
				  <xsl:when test="px:RmtInf/px:Strd/px:Invcee/px:Id/px:OrgId/px:IBEI">
					<xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:Id/px:OrgId/px:IBEI"/>
				  </xsl:when>
				  <xsl:when test="px:RmtInf/px:Strd/px:Invcee/px:Id/px:OrgId/px:BEI">
					<xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:Id/px:OrgId/px:BEI"/>
				  </xsl:when>		  
				  </xsl:choose>
				</OrgIdentBIC>
				<OrganisIdentOtherIdentification>
				<xsl:choose>
				  <xsl:when test="px:RmtInf/px:Strd/px:Invcee/px:Id/px:OrgId/px:EANGLN">
					<xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:Id/px:OrgId/px:EANGLN"/>
				  </xsl:when>
				  <xsl:when test="px:RmtInf/px:Strd/px:Invcee/px:Id/px:OrgId/px:USCHU">
					<xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:Id/px:OrgId/px:USCHU"/>
				  </xsl:when>
				  <xsl:when test="px:RmtInf/px:Strd/px:Invcee/px:Id/px:OrgId/px:DUNS">
					<xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:Id/px:OrgId/px:DUNS"/>
				  </xsl:when>
				  <xsl:when test="px:RmtInf/px:Strd/px:Invcee/px:Id/px:OrgId/px:BkPtyId">
					<xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:Id/px:OrgId/px:BkPtyId"/>
				  </xsl:when>
				  <xsl:when test="px:RmtInf/px:Strd/px:Invcee/px:Id/px:OrgId/px:TaxIdNb">
					<xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:Id/px:OrgId/px:TaxIdNb"/>
				  </xsl:when>		  
				  </xsl:choose>
				</OrganisIdentOtherIdentification>
                  <OrganisIdentOtherCode/>
                  <OrganisIdentOtherProprietary>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:Id/px:OrgId/px:PrtryId/px:Id"/>
                  </OrganisIdentOtherProprietary>
                  <OrganisIdentOtherIssuer>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:Id/px:OrgId/px:PrtryId/px:Issr"/>
                  </OrganisIdentOtherIssuer>
                  <PrivateIdentBirthDate>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:BirthDt"/>
                  </PrivateIdentBirthDate>
                  <PrivateIdentProvinceOfBirth>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:PrvcOfBirth"/>
                  </PrivateIdentProvinceOfBirth>
                  <PrivateIdentCityOfBirth>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:CityOfBirth"/>
                  </PrivateIdentCityOfBirth>
                  <PrivateIdentCountryOfBirth>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:Id/px:PrvtId/px:DtAndPlcOfBirth/px:CtryOfBirth"/>
                  </PrivateIdentCountryOfBirth>
                  <OtherPersonIdentification>
                    <PrivateIdentOtherIdentification>
                      <xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:Id/px:PrvtId/px:OthrId/px:Id"/>
                    </PrivateIdentOtherIdentification>
                    <PrivateIdentOtherCode/>
                    <PrivateIdentOtherProprietary/>
                    <PrivateIdentOtherIssuer>
                      <xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:Id/px:PrvtId/px:Issr"/>
                    </PrivateIdentOtherIssuer>
                  </OtherPersonIdentification>
                  <CountryOfResidence>
                    <xsl:value-of select="px:RmtInf/px:Strd/px:Invcee/px:CtryOfRes"/>
                  </CountryOfResidence>
                  <ContactDetailsNamePrefix/>
                  <ContactDetailsName/>
                  <ContactDetailsPhoneNumber/>
                  <ContactDetailsMobileNumber/>
                  <ContactDetailsFaxNumber/>
                  <ContactDetailsEmailAddress/>
                  <ContactDetailsOther/>
                </InvoiceePartyIdentification>
                <AdditionalRemittanceInformation>
                  <xsl:value-of select="px:RmtInf/px:Strd/px:AddtlRmtInf"/>
                </AdditionalRemittanceInformation>
              </RemittanceInformation>
            </Transaction>
          </xsl:for-each>
        </CreditTransfer>          
        </PayContainer>
      </xsl:for-each>
    </px:PayOrder>
  </xsl:template>
</xsl:stylesheet>
