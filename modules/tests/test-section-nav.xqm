xquery version "3.1";

module namespace x="http://history.state.gov/ns/site/hsg/tests/test-section-nav";
import module namespace t="http://history.state.gov/ns/site/hsg/xqsuite" at "../xqsuite.xqm";
import module namespace pages="http://history.state.gov/ns/site/hsg/pages" at "../pages.xqm";
import module namespace config="http://history.state.gov/ns/site/hsg/config" at "../config.xqm";
import module namespace templates="http://exist-db.org/xquery/templates";

declare namespace test="http://exist-db.org/xquery/xqsuite";
declare namespace tei="http://www.tei-c.org/ns/1.0";

(: testing for section navigation sidebar :)

declare variable $x:sitemap := 
  <root xmlns="http://ns.evolvedbinary.com/sitemap" xmlns:site="http://ns.evolvedbinary.com/sitemap">
    <step value="departmenthistory">
     <step value="timeline">
       <step key="section">
         <page-template href="/db/apps/hsg-shell/pages/departmenthistory/timeline/section.xml">
           <with-param name="publication-id" value="timeline"/>
           <with-param name="document-id" value="timeline"/>
           <with-param name="section-id" keyval="section"/>
         </page-template>
         <config>
           <src doc="/db/apps/administrative-timeline/timeline/timeline.xml" xq=".//@xml:id"/>
         </config>
       </step>
       <page-template href="/db/apps/hsg-shell/pages/departmenthistory/timeline/index.xml">
         <with-param name="publication-id" value="timeline"/>
         <with-param name="document-id" value="timeline"/>
       </page-template>
     </step>
     <step value="short-history">
       <step key="section">
         <page-template href="/db/apps/hsg-shell/pages/departmenthistory/short-history/section.xml">
           <with-param name="publication-id" value="short-history"/>
           <with-param name="document-id" value="short-history"/>
           <with-param name="section-id" keyval="section"/>
         </page-template>
         <config>
           <src doc="/db/apps/other-publications/short-history/short-history.xml" xq=".//@xml:id"/>
         </config>
       </step>
       <page-template href="/db/apps/hsg-shell/pages/departmenthistory/short-history/index.xml">
         <with-param name="publication-id" value="short-history"/>
         <with-param name="document-id" value="short-history"/>
       </page-template>
       <config>
         <section-nav-exclude/>
       </config>
     </step>
     <step value="buildings">
       <step key="section">
         <page-template href="/db/apps/hsg-shell/pages/departmenthistory/buildings/section.xml">
           <with-param name="publication-id" value="buildings"/>
           <with-param name="document-id" value="buildings"/>
           <with-param name="section-id" keyval="section"/>
         </page-template>
         <config>
           <src doc="/db/apps/other-publications/buildings/buildings.xml" xq=".//@xml:id"/>
         </config>
       </step>
       <page-template href="/db/apps/hsg-shell/pages/departmenthistory/buildings/index.xml">
         <with-param name="publication-id" value="buildings"/>
         <with-param name="document-id" value="buildings"/>
         <with-param name="section-id" value="intro"/>
       </page-template>
     </step>
     <step value="people">
       <step value="secretaries">
         <page-template href="/db/apps/hsg-shell/pages/departmenthistory/people/secretaries.xml">
           <with-param name="publication-id" value="secretaries"/>
         </page-template>
       </step>
       <step value="principals-chiefs">
         <page-template href="/db/apps/hsg-shell/pages/departmenthistory/people/principals-chiefs.xml">
           <with-param name="publication-id" value="principals-chiefs"/>
         </page-template>
       </step>
       <step value="by-name">
         <step key="letter">
           <page-template href="/db/apps/hsg-shell/pages/departmenthistory/people/by-name/letter.xml">
             <with-param name="publication-id" value="people-by-alpha"/>
             <with-param name="letter" keyval="letter"/>
           </page-template>
           <config>
             <src child-collections="/db/apps/pocom/people"/>
           </config>
         </step>
         <page-template href="/db/apps/hsg-shell/pages/departmenthistory/people/by-name/index.xml">
           <with-param name="publication-id" value="people-by-alpha"/>
         </page-template>
         <config>
           <section-nav-exclude/>
         </config>
       </step>
       <step value="by-year">
         <step key="year">
           <page-template href="/db/apps/hsg-shell/pages/departmenthistory/people/by-year/year.xml">
             <with-param name="publication-id" value="people-by-year"/>
             <with-param name="year" keyval="year"/>
           </page-template>
           <config>
             <src collection="/db/apps/pocom" xq="distinct-values(for $date in .//date[not(. = '')] return xs:integer(substring($date, 1, 4)))"/>
           </config>
         </step>
         <page-template href="/db/apps/hsg-shell/pages/departmenthistory/people/by-year/index.xml">
           <with-param name="publication-id" value="people-by-year"/>
         </page-template>
         <config>
           <section-nav-exclude/>
         </config>
       </step>
       <step value="principalofficers">
         <step key="role">
           <page-template href="/db/apps/hsg-shell/pages/departmenthistory/people/principalofficers/by-role-id.xml">
             <with-param name="publication-id" value="people-by-role"/>
             <with-param name="role-id" keyval="role"/>
           </page-template>
           <config>
             <src collection="/db/apps/pocom/positions-principals"/>
           </config>
         </step>
         <page-template href="/db/apps/hsg-shell/pages/departmenthistory/people/principalofficers/index.xml">
           <with-param name="publication-id" value="people"/>
         </page-template>
         <config>
           <section-nav-exclude/>
         </config>
       </step>
       <step value="chiefsofmission">
         <step value="by-country">
           <page-template href="/db/apps/hsg-shell/pages/departmenthistory/people/chiefsofmission/countries-list.xml">
             <with-param name="publication-id" value="people"/>
           </page-template>
         </step>
         <step value="by-organization">
           <page-template href="/db/apps/hsg-shell/pages/departmenthistory/people/chiefsofmission/international-organizations-list.xml">
             <with-param name="publication-id" value="people"/>
           </page-template>
         </step>
         <step key="org">
           <page-template href="/db/apps/hsg-shell/pages/departmenthistory/people/chiefsofmission/by-role-or-country-id.xml">
             <with-param name="publication-id" value="people"/>
             <with-param name="role-or-country-id" keyval="org"/>
           </page-template>
           <config>
             <src collection="/db/apps/pocom/missions-orgs"/>
             <src collection="/db/apps/pocom/missions-countries"/>
           </config>
         </step>
         <page-template href="/db/apps/hsg-shell/pages/departmenthistory/people/chiefsofmission/index.xml">
           <with-param name="publication-id" value="people"/>
         </page-template>
         <config>
           <section-nav-exclude/>
         </config>
       </step>
       <step key="person">
         <page-template href="/db/apps/hsg-shell/pages/departmenthistory/people/person.xml">
           <with-param name="person-id" keyval="person"/>
           <with-param name="document-id" keyval="person"/>
           <with-param name="publication-id" value="people"/>
         </page-template>
         <config>
           <src collection="/db/apps/pocom/people"/>
         </config>
       </step>
       <page-template href="/db/apps/hsg-shell/pages/departmenthistory/people/index.xml">
         <with-param name="publication-id" value="people"/>
       </page-template>
       <config>
         <section-nav-skip/>
       </config>
     </step>
     <step value="travels">
       <step value="president">
         <step key="id">
           <page-template href="/db/apps/hsg-shell/pages/departmenthistory/travels/president/person-or-country.xml">
             <with-param name="person-or-country-id" keyval="id"/>
             <with-param name="publication-id" value="travels-president"/>
           </page-template>
           <config>
             <src collection="/db/apps/travels/president-travels" xq="trips/trip/@who"/>
             <src collection="/db/apps/travels/president-travels" xq="distinct-values(trips/trip/country/@id)"/>
           </config>
         </step>
         <page-template href="/db/apps/hsg-shell/pages/departmenthistory/travels/president/index.xml">
           <with-param name="publication-id" value="travels-president"/>
         </page-template>
       </step>
       <step value="secretary">
         <step key="id">
           <page-template href="/db/apps/hsg-shell/pages/departmenthistory/travels/secretary/person-or-country.xml">
             <with-param name="person-or-country-id" keyval="id"/>
             <with-param name="publication-id" value="travels-secretary"/>
           </page-template>
           <config>
             <src collection="/db/apps/travels/secretary-travels" xq="distinct-values(trips/trip/@who)"/>
             <src collection="/db/apps/travels/secretary-travels" xq="distinct-values(trips/trip/country/@id)"/>
           </config>
         </step>
         <page-template href="/db/apps/hsg-shell/pages/departmenthistory/travels/secretary/index.xml">
           <with-param name="publication-id" value="travels-secretary"/>
         </page-template>
       </step>
       <page-template href="/db/apps/hsg-shell/pages/departmenthistory/travels/index.xml">
         <with-param name="publication-id" value="travels-secretary"/>
       </page-template>
       <config>
         <section-nav-skip/>
       </config>
     </step>
     <step value="visits">
       <step key="id">
         <page-template href="/db/apps/hsg-shell/pages/departmenthistory/visits/country-or-year.xml">
           <with-param name="publication-id" value="visits"/>
           <with-param name="country-or-year" keyval="id"/>
         </page-template>
         <config>
           <src collection="/db/apps/visits/data" xq="distinct-values(             for $date in .//(start-date | end-date)             let $year := year-from-date($date)             return $year           )"/>
           <src collection="/db/apps/visits/data" xq="visits/visit/from/@id"/>
         </config>
       </step>
       <page-template href="/db/apps/hsg-shell/pages/departmenthistory/visits/index.xml">
         <with-param name="publication-id" value="visits"/>
       </page-template>
     </step>
     <step value="wwi">
       <page-template href="/db/apps/hsg-shell/pages/departmenthistory/wwi.xml">
         <with-param name="publication-id" value="wwi"/>
       </page-template>
     </step>
     <step value="diplomatic-couriers">
       <step value="before-the-jet-age">
         <page-template href="/db/apps/hsg-shell/pages/departmenthistory/diplomatic-couriers/before-the-jet-age.xml">
           <with-param name="publication-id" value="diplomatic-couriers"/>
           <with-param name="film-id" value="before-the-jet-age"/>
         </page-template>
       </step>
       <step value="behind-the-iron-curtain">
         <page-template href="/db/apps/hsg-shell/pages/departmenthistory/diplomatic-couriers/behind-the-iron-curtain.xml">
           <with-param name="publication-id" value="diplomatic-couriers"/>
           <with-param name="film-id" value="behind-the-iron-curtain"/>
         </page-template>
       </step>
       <step value="into-moscow">
         <page-template href="/db/apps/hsg-shell/pages/departmenthistory/diplomatic-couriers/into-moscow.xml">
           <with-param name="publication-id" value="diplomatic-couriers"/>
           <with-param name="film-id" value="into-moscow"/>
         </page-template>
       </step>
       <step value="through-the-khyber-pass">
         <page-template href="/db/apps/hsg-shell/pages/departmenthistory/diplomatic-couriers/through-the-khyber-pass.xml">
           <with-param name="publication-id" value="diplomatic-couriers"/>
           <with-param name="film-id" value="through-the-khyber-pass"/>
         </page-template>
       </step>
       <page-template href="/db/apps/hsg-shell/pages/departmenthistory/diplomatic-couriers/index.xml">
         <with-param name="publication-id" value="diplomatic-couriers"/>
       </page-template>
     </step>
     <page-template href="/db/apps/hsg-shell/pages/departmenthistory/index.xml">
       <with-param name="publication-id" value="departmenthistory"/>
     </page-template>
   </step>
  </root>
;

declare variable $x:expected := 
  <div id="sections" class="hsg-panel">
    <div class="hsg-panel-heading">
      <h2 class="hsg-sidebar-title">Department History</h2>
    </div>
    <ul class="hsg-list-group">
      <li class="hsg-list-group-item">
        <a href="/exist/apps/hsg-shell/departmenthistory/timeline"> Administrative Timeline </a>
      </li>
      <li class="hsg-list-group-item">
        <a href="/exist/apps/hsg-shell/departmenthistory/buildings"> Buildings of the Department </a>
      </li>
      <li class="hsg-list-group-item">
        <a href="/exist/apps/hsg-shell/departmenthistory/people/secretaries"> Biographies of the Secretaries of State </a>
      </li>
      <li class="hsg-list-group-item">
        <a href="/exist/apps/hsg-shell/departmenthistory/people/principals-chiefs"> Principal Officers and Chiefs of Mission </a>
      </li>
      <li class="hsg-list-group-item">
        <a href="/exist/apps/hsg-shell/departmenthistory/travels/president"> Travels of the President </a>
      </li>
      <li class="hsg-list-group-item">
        <a href="/exist/apps/hsg-shell/departmenthistory/travels/secretary"> Travels of the Secretary </a>
      </li>
      <li class="hsg-list-group-item">
        <a href="/exist/apps/hsg-shell/departmenthistory/visits"> Visits by Foreign Leaders </a>
      </li>
      <li class="hsg-list-group-item">
        <a href="/exist/apps/hsg-shell/departmenthistory/wwi"> World War I and the Department </a>
      </li>
      <li class="hsg-list-group-item">
        <a href="/exist/apps/hsg-shell/departmenthistory/diplomatic-couriers"> U.S. Diplomatic Couriers </a>
      </li>
    </ul>
  </div>
;

(:
 :  WHEN generating a section nav panel
 :  GIVEN a top level url ("/departmenthistory")
 :  THEN return the generated section nav panel
 :)

declare %test:assertEquals('true') function x:section-nav-toplevel(){
  let $result := pages:generate-section-nav('/departmenthistory')
  return if (deep-equal($x:expected, $result)) 
  then 'true' 
  else (<result>{$result}</result>, <expected>{$x:expected}</expected>)
};

(:
 :  WHEN generating a section nav panel
 :  GIVEN a lower level url ("/departmenthistory/travels/secretary/root-elihu")
 :  THEN return the same generated section nav panel as for the top level
 :)

declare %test:assertEquals('true') function x:section-nav-bottomlevel(){
  let $result   := pages:generate-section-nav('/departmenthistory/travels/secretary/root-elihu')
  let $expected := pages:generate-section-nav('/departmenthistory')
  return if (deep-equal($expected, $result)) then
    'true' 
  else (<result>{$result}</result>, <expected>{$expected}</expected>)
};