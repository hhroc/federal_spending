
CREATE OR REPLACE FUNCTION contracts_insert_trigger()
RETURNS TRIGGER AS $$
DECLARE
    ins_sql TEXT;
    BEGIN
        ins_sql :=
            'INSERT INTO usaspending_contract_' || to_char(NEW.fiscal_year, '9999') ||
            '(unique_transaction_id,transaction_status,obligatedamount,baseandexercisedoptionsvalue,baseandalloptionsvalue,maj_agency_cat,mod_agency,maj_fund_agency_cat,contractingofficeagencyid,contractingofficeid,fundingrequestingagencyid,fundingrequestingofficeid,fundedbyforeignentity,signeddate,effectivedate,currentcompletiondate,ultimatecompletiondate,lastdatetoorder,contractactiontype,reasonformodification,typeofcontractpricing,priceevaluationpercentdifference,subcontractplan,lettercontract,multiyearcontract,performancebasedservicecontract,majorprogramcode,contingencyhumanitarianpeacekeepingoperation,contractfinancing,costorpricingdata,costaccountingstandardsclause,descriptionofcontractrequirement,purchasecardaspaymentmethod,numberofactions,nationalinterestactioncode,progsourceagency,progsourceaccount,progsourcesubacct,account_title,rec_flag,typeofidc,multipleorsingleawardidc,programacronym,vendorname,vendoralternatename,vendorlegalorganizationname,vendordoingasbusinessname,divisionname,divisionnumberorofficecode,vendorenabled,vendorlocationdisableflag,ccrexception,streetaddress,streetaddress2,streetaddress3,city,state,zipcode,vendorcountrycode,vendor_state_code,vendor_cd,congressionaldistrict,vendorsitecode,vendoralternatesitecode,dunsnumber,parentdunsnumber,phoneno,faxno,registrationdate,renewaldate,mod_parent,locationcode,statecode,pop_state_code,placeofperformancecountrycode,placeofperformancezipcode,pop_cd,placeofperformancecongressionaldistrict,psc_cat,productorservicecode,systemequipmentcode,claimantprogramcode,principalnaicscode,informationtechnologycommercialitemcategory,gfe_gfp,useofepadesignatedproducts,recoveredmaterialclauses,seatransportation,contractbundling,consolidatedcontract,countryoforigin,placeofmanufacture,manufacturingorganizationtype,agencyid,piid,modnumber,transactionnumber,fiscal_year,idvagencyid,idvpiid,idvmodificationnumber,solicitationid,extentcompeted,reasonnotcompeted,numberofoffersreceived,commercialitemacquisitionprocedures,commercialitemtestprogram,smallbusinesscompetitivenessdemonstrationprogram,a76action,competitiveprocedures,solicitationprocedures,typeofsetaside,localareasetaside,evaluatedpreference,fedbizopps,research,statutoryexceptiontofairopportunity,organizationaltype,numberofemployees,annualrevenue,firm8aflag,hubzoneflag,sdbflag,shelteredworkshopflag,hbcuflag,educationalinstitutionflag,womenownedflag,veteranownedflag,srdvobflag,localgovernmentflag,minorityinstitutionflag,aiobflag,stategovernmentflag,federalgovernmentflag,minorityownedbusinessflag,apaobflag,tribalgovernmentflag,baobflag,naobflag,saaobflag,nonprofitorganizationflag,haobflag,emergingsmallbusinessflag,hospitalflag,contractingofficerbusinesssizedetermination,receivescontracts,receivesgrants,receivescontractsandgrants,walshhealyact,servicecontractact,davisbaconact,clingercohenact,otherstatutoryauthority,interagencycontractingauthority,isserviceprovider) VALUES ' ||

            '(' || NEW.unique_transaction_id ||', '|| NEW.transaction_status ||', '|| NEW.obligatedamount ||', '|| NEW.baseandexercisedoptionsvalue ||', '|| NEW.baseandalloptionsvalue ||', '|| NEW.maj_agency_cat ||', '|| NEW.mod_agency ||', '|| NEW.maj_fund_agency_cat ||', '|| NEW.contractingofficeagencyid ||', '|| NEW.contractingofficeid ||', '|| NEW.fundingrequestingagencyid ||', '|| NEW.fundingrequestingofficeid ||', '|| NEW.fundedbyforeignentity ||', '|| NEW.signeddate ||', '|| NEW.effectivedate ||', '|| NEW.currentcompletiondate ||', '|| NEW.ultimatecompletiondate ||', '|| NEW.lastdatetoorder ||', '|| NEW.contractactiontype ||', '|| NEW.reasonformodification ||', '|| NEW.typeofcontractpricing ||', '|| NEW.priceevaluationpercentdifference ||', '|| NEW.subcontractplan ||', '|| NEW.lettercontract ||', '|| NEW.multiyearcontract ||', '|| NEW.performancebasedservicecontract ||', '|| NEW.majorprogramcode ||', '|| NEW.contingencyhumanitarianpeacekeepingoperation ||', '|| NEW.contractfinancing ||', '|| NEW.costorpricingdata ||', '|| NEW.costaccountingstandardsclause ||', '|| NEW.descriptionofcontractrequirement ||', '|| NEW.purchasecardaspaymentmethod ||', '|| NEW.numberofactions ||', '|| NEW.nationalinterestactioncode ||', '|| NEW.progsourceagency ||', '|| NEW.progsourceaccount ||', '|| NEW.progsourcesubacct ||', '|| NEW.account_title ||', '|| NEW.rec_flag ||', '|| NEW.typeofidc ||', '|| NEW.multipleorsingleawardidc ||', '|| NEW.programacronym ||', '|| NEW.vendorname ||', '|| NEW.vendoralternatename ||', '|| NEW.vendorlegalorganizationname ||', '|| NEW.vendordoingasbusinessname ||', '|| NEW.divisionname ||', '|| NEW.divisionnumberorofficecode ||', '|| NEW.vendorenabled ||', '|| NEW.vendorlocationdisableflag ||', '|| NEW.ccrexception ||', '|| NEW.streetaddress ||', '|| NEW.streetaddress2 ||', '|| NEW.streetaddress3 ||', '|| NEW.city ||', '|| NEW.state ||', '|| NEW.zipcode ||', '|| NEW.vendorcountrycode ||', '|| NEW.vendor_state_code ||', '|| NEW.vendor_cd ||', '|| NEW.congressionaldistrict ||', '|| NEW.vendorsitecode ||', '|| NEW.vendoralternatesitecode ||', '|| NEW.dunsnumber ||', '|| NEW.parentdunsnumber ||', '|| NEW.phoneno ||', '|| NEW.faxno ||', '|| NEW.registrationdate ||', '|| NEW.renewaldate ||', '|| NEW.mod_parent ||', '|| NEW.locationcode ||', '|| NEW.statecode ||', '|| NEW.pop_state_code ||', '|| NEW.placeofperformancecountrycode ||', '|| NEW.placeofperformancezipcode ||', '|| NEW.pop_cd ||', '|| NEW.placeofperformancecongressionaldistrict ||', '|| NEW.psc_cat ||', '|| NEW.productorservicecode ||', '|| NEW.systemequipmentcode ||', '|| NEW.claimantprogramcode ||', '|| NEW.principalnaicscode ||', '|| NEW.informationtechnologycommercialitemcategory ||', '|| NEW.gfe_gfp ||', '|| NEW.useofepadesignatedproducts ||', '|| NEW.recoveredmaterialclauses ||', '|| NEW.seatransportation ||', '|| NEW.contractbundling ||', '|| NEW.consolidatedcontract ||', '|| NEW.countryoforigin ||', '|| NEW.placeofmanufacture ||', '|| NEW.manufacturingorganizationtype ||', '|| NEW.agencyid ||', '|| NEW.piid ||', '|| NEW.modnumber ||', '|| NEW.transactionnumber ||', '|| NEW.fiscal_year ||', '|| NEW.idvagencyid ||', '|| NEW.idvpiid ||', '|| NEW.idvmodificationnumber ||', '|| NEW.solicitationid ||', '|| NEW.extentcompeted ||', '|| NEW.reasonnotcompeted ||', '|| NEW.numberofoffersreceived ||', '|| NEW.commercialitemacquisitionprocedures ||', '|| NEW.commercialitemtestprogram ||', '|| NEW.smallbusinesscompetitivenessdemonstrationprogram ||', '|| NEW.a76action ||', '|| NEW.competitiveprocedures ||', '|| NEW.solicitationprocedures ||', '|| NEW.typeofsetaside ||', '|| NEW.localareasetaside ||', '|| NEW.evaluatedpreference ||', '|| NEW.fedbizopps ||', '|| NEW.research ||', '|| NEW.statutoryexceptiontofairopportunity ||', '|| NEW.organizationaltype ||', '|| NEW.numberofemployees ||', '|| NEW.annualrevenue ||', '|| NEW.firm8aflag ||', '|| NEW.hubzoneflag ||', '|| NEW.sdbflag ||', '|| NEW.shelteredworkshopflag ||', '|| NEW.hbcuflag ||', '|| NEW.educationalinstitutionflag ||', '|| NEW.womenownedflag ||', '|| NEW.veteranownedflag ||', '|| NEW.srdvobflag ||', '|| NEW.localgovernmentflag ||', '|| NEW.minorityinstitutionflag ||', '|| NEW.aiobflag ||', '|| NEW.stategovernmentflag ||', '|| NEW.federalgovernmentflag ||', '|| NEW.minorityownedbusinessflag ||', '|| NEW.apaobflag ||', '|| NEW.tribalgovernmentflag ||', '|| NEW.baobflag ||', '|| NEW.naobflag ||', '|| NEW.saaobflag ||', '|| NEW.nonprofitorganizationflag ||', '|| NEW.haobflag ||', '|| NEW.emergingsmallbusinessflag ||', '|| NEW.hospitalflag ||', '|| NEW.contractingofficerbusinesssizedetermination ||', '|| NEW.receivescontracts ||', '|| NEW.receivesgrants ||', '|| NEW.receivescontractsandgrants ||', '|| NEW.walshhealyact ||', '|| NEW.servicecontractact ||', '|| NEW.davisbaconact ||', '|| NEW.clingercohenact ||', '|| NEW.otherstatutoryauthority ||', '|| NEW.interagencycontractingauthority ||', '|| NEW.isserviceprovider ||')'
            ;

        EXECUTE ins_sql;
        RETURN NULL;
    END
    $$
    LANGUAGE plpgsql;
