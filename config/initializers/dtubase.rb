# encoding: utf-8

Dtubase.configure do |config|
  config.url      = Toshokan::Application.config.dtubase[:url]
  config.username = Toshokan::Application.config.dtubase[:username]
  config.password = Toshokan::Application.config.dtubase[:password]
end

if Toshokan::Application.config.stub_authentication
  Dtubase.config.test_mode = true
  Dtubase.config.add_mock("0", %{<?xml version="1.0" encoding="utf-8"?>
    <root>
      <account matrikel_id="0" cprnr="XXXXXX-XXXX" last_updated="" last_updated_all="" auth_gateway="unix" fk_createdby_matrikel_id="1" username="username" sysadm="0" firstname="Firstname" lastname="Lastname" title="" company_address="" company_address_is_primary="0" company_address_is_hidden="1" temporary_address="" temporary_address_is_primary="0" temporary_address_is_hidden="1" private_homepage_url="" official_email_address="" official_picture_url="" official_picture_hide_in_cn="1" sms_provider="" sms_phone="" library_pincode="" library_username="" primary_profile_id="" preferred_language="en" hide_private_address="0" note="" dtu_initials="" has_active_profile="1" external_Phonebook="1" external_Portalen="1" external_Biblioteket="1" nextOfKinName="" nextOfKinRelation="" nextOfKinTelephone="">
        <private_address address_id="" hide_address="0" is_primary_address="0" is_secret_address="0" street="YYYYYYYYYYY, ZZZ" building="" room="" zipcode="XXXX" city="YYYYYY" country="" phone1="" phone2="" phone3="" mobile_phone="" fax="" picture_url="" homepage_url="" email_address="" institution_name="" institution_number="" title="" location_map_name="" location_map_coordinates="" />
        <profile_employee fk_profile_id="" fk_createdby_matrikel_id="" last_updated="" fk_matrikel_id="" fk_orgunit_id="58" active="1" employee_number="" position_title="Programmør" position_title_uk="Programmer" note="" mail_servername="" mail_servertype="" external_Portalen="1" external_Phonebook="1" external_Biblioteket="1" ReferenceMatrikelId="" ReferenceTypeId="3">
          <date_created>2010-07-07T13:27:00</date_created>
          <dt_employment_start>2010-09-01T00:00:00</dt_employment_start>
          <address address_id="" hide_address="0" is_primary_address="1" is_secret_address="0" street="" building="101D" room="" zipcode="" city="" country="dk" phone1="" phone2="" phone3="" mobile_phone="" fax="" picture_url="" homepage_url="" email_address="sego@dtic.dtu.dk" institution_name="" institution_number="" title="" location_map_name="" location_map_coordinates="" />
          <scanpas fk_profile_id="" stiko="3771" stiko_stilling="Programmør" stiko_startdate="2010-09-01T00:00:00" stiko_enddate="2011-03-31T00:00:00" stiko_primary="1" stiko_calcprimary="1" stiko_loenform="2" stiko_inst="55" FacultyKey="0" />
        </profile_employee>
        <profile_student fk_profile_id="" phd_scanpas="" fk_createdby_matrikel_id="1" last_updated="2010-08-25T13:20:00" fk_matrikel_id="41453" fk_orgunit_id="stud" active="0" exchange="0" phd="1" open_university="0" ordinary="0" admission="0" stads_userid="" stads_studentcode="" study_line="" study_frame="PHDGÆST02" study_frame2="PH. D." point="0" note="" mail_servername="" mail_servertype="IMAP4" ftp_servername="" ftp_serverport="21" ftp_homedir="/" ftp_username="" Adresseland="" Nationalitet="DK" ApplicationNo="" optagelsesaar="2007" uddannelse_dk="" uddannelse_uk="" retning_dk="" retning_uk="">
          <date_end>2008-02-18T00:00:00</date_end>
          <date_created>2007-06-12T03:47:00</date_created>
          <date_archived>2008-02-19T05:00:00</date_archived>
          <ramme_start_dato>2007-06-11T00:00:00</ramme_start_dato>
          <address address_id="" hide_address="1" is_primary_address="0" is_secret_address="0" street="" building="" room="" zipcode="" city="" country="DK" phone1="" phone2="" phone3="" mobile_phone="" fax="" picture_url="" homepage_url="" email_address="" institution_name="" institution_number="" title="studerende" location_map_name="" location_map_coordinates="" />
        </profile_student>
      </account>
    </root>
  })  
end