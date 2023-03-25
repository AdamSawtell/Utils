# Script Purpose: Obfuscation of all sensitive data froman AbilityERP build
# Script Name: AbERP__obfuscation.sql
# Script Creater: Adam Sawtell
# Created: 26/03/2023
# Notes: Created using Chuck SQL obfuscation script as a reference

# Windows included in obfuscation
# - BUSINESS PARTNER
# -- Contact User
# -- Activity -- To Add
# -- Activity (BP Accociates) -- To Add
# -- Location
# -- Bank Account
# -- Shipping Accounts




# Business Partner details
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

