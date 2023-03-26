# Script Purpose: Obfuscation of all sensitive data froman AbilityERP build
# Script Name: AbERP__obfuscation.sql
# Script Creater: Adam Sawtell
# Created: 26/03/2023
# Notes: Created using Chuck SQL obfuscation script as a reference

# Windows included in obfuscation
# - BUSINESS PARTNER
# -- Contact User
# -- Activity
# -- Activity (BP Accociates) -- To Add
# -- Location
# -- Bank Account
# -- Shipping Accounts




# Business Partner details - Support Reciever, Vendor Other BP Groups 

-- Window: Business Partner 
update C_BPartner bp
set 
value = 'FlamingoBP' || bp.c_bpartner_id, 
name = 'FlamingoBP' || bp.c_bpartner_id, 
--chuboe_name_first = 'flamingo',
--chuboe_name_last = 'flamingo',
description = 'FlamingoBP Test Data - Obfuscation', 
name2 = null, 
taxId = '1', 
ReferenceNo = '1',
url = 'flamingologic.com.au'
;

-- Tab: Contact (User)
update AD_User u
set 
Name='Flamingo User' || u.ad_user_id, 
Description='FlamingoBP Test Data - Obfuscation' || u.ad_user_id
where u.name <> 'SuperUser'
  and ((u.c_bpartner_id is null) 
    or (
      SELECT xbp.ISEMPLOYEE 
      FROM C_BPARTNER xbp 
      WHERE u.C_BPartner_ID = xbp.C_BPARTNER_ID) = 'N')
;

-- Tab: Activity
update C_ContactActivity
set 
Description = 'FlamingoBP Test Data - Obfuscation',
Comments = 'FlamingoBP Test Data - Obfuscation'
;

-- Tab: Business Partner Bank Account
update C_BP_BankAccount
set 
a_name = 'Obfuscation', 
a_street = 'Obfuscation',
a_city = 'Obfuscation',
a_state = 'Obfuscation',
a_zip = '1',
a_ident_dl = 'Obfuscation',
a_email = 'Obfuscation',
a_ident_ssn = 'Obfuscation',
a_country = 'Obfuscation',
customerpaymentprofileid = '1',
creditcardnumber = '1',
routingno = '1',
accountno = '1',
creditcardvv = '1',
creditcardexpmm = 1,
creditcardexpyy = 1
;

-- Tab: Business Partner Shipper Account
update C_BP_ShippingAcct
set 
shipperaccount = 'Obfuscation',
dutiesshipperaccount = 'Obfuscation',
shippermeter = 'Obfuscation'
;

-- Tab: Business Partner Location
update C_BPartner_Location bpl
set 
name='Obfuscation' || bpl.c_bpartner_location_id, 
Phone='1', 
Phone2='1', 
Fax='1',
Description='FlamingoBP Test Data - Obfuscation',
Email='Obfuscation'
;


# Business Partner details - Employee

-- Employee
update AD_User u
set 
Name='FlamingoEmployee' || u.ad_user_id, 
Description='FlamingoEmployee' || u.ad_user_id
where u.name <> 'SuperUser'
  and ((u.c_bpartner_id is null) 
    or (
      SELECT xbp.ISEMPLOYEE 
      FROM C_BPARTNER xbp 
      WHERE u.C_BPartner_ID = xbp.C_BPARTNER_ID) = 'Y')
;


-- Tab: Contact (User)
update AD_User u
set 
Password='password', 
Email='Obfuscation',  
Phone='1', 
Phone2='1', 
Fax='1', 
EmailUserPW=null, 
EmailUser=null, 
EmailVerify=null, 
Birthday=null
;

-- Tab: Activity
update C_ContactActivity
set 
Description = 'FlamingoBP Test Data - Obfuscation',
Comments = 'FlamingoBP Test Data - Obfuscation'
;

-- Tab: Location
update C_Location loc
set 
Address1='Obfuscation', 
Address2='Obfuscation', 
Address3='Obfuscation', 
Address4='Obfuscation',
city='Obfuscation',
postal='1',
c_region_id=171,
c_country_id=122
;

-- Bank Account
update C_BankAccount ba
set AccountNo = 'BankAcct: '||ba.c_bankaccount_id
;

# Client Window


-- Window: Support Receiver/ Client 
update C_BPartner bp
set
AbERP_First_Name = 'Support',
AbERP_Last_Name = 'Receiver',
AbERP_Preferred_Name = 'Flamingo',
AbERP_Middle_name = 'Flamingo',
Phone = '1',
AbERP_NDIS_Region = '1',
AbERP_Addtl_Disability_Info = 'FlamingoBP Test Data - Obfuscation'
;

-- Tab: Alert 
update AbERP_Alert_SR
set
Name = 'FlamingoBP Test Data - Obfuscation',
Description = 'FlamingoBP Test Data - Obfuscation'
;

-- Tab: BP Associations
update AbERP_BP_Associations
set
Name = 'FlamingoBP Test Data - Obfuscation',
Description = 'FlamingoBP Test Data - Obfuscation'
;

-- Tab: BP Associations
-- No Updates Required


