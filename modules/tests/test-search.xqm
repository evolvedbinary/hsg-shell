xquery version "3.1";

module namespace x="http://history.state.gov/ns/site/hsg/tests/test-search";

import module namespace search = "http://history.state.gov/ns/site/hsg/search" at "../search.xqm";
(:import module namespace app="http://history.state.gov/ns/site/hsg/templates" at "../app.xqm";
import module namespace config="http://history.state.gov/ns/site/hsg/config" at "config.xqm";
import module namespace console="http://exist-db.org/xquery/console" at "java:org.exist.console.xquery.ConsoleModule";
import module namespace t="http://history.state.gov/ns/site/hsg/xqsuite" at "../xqsuite.xqm";
import module namespace pages="http://history.state.gov/ns/site/hsg/pages" at "../pages.xqm";:)
import module namespace templates="http://exist-db.org/xquery/html-templating";

declare namespace test="http://exist-db.org/xquery/xqsuite";

declare %test:assertEquals('S\/S') function x:sanitizeForeSlash() {
    search:sanitize-query('S/S')
};

declare %test:assertEquals('Hello World') function x:sanitizeWhitespace() {
    search:sanitize-query(' Hello    World  ')
};

declare %test:assertEmpty function x:sanitizeEmpty() {
    search:sanitize-query('  ')
};

declare %test:assertEquals('S/S') function x:desanitizeForeSlash() {
    search:desanitize-query('S\/S')
};

declare %test:assertEquals('Hello World') function x:desanitizeWhitespace() {
    search:desanitize-query(' Hello    World  ')
};