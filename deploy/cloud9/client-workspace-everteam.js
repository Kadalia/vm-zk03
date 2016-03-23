"use strict";

module.exports = function(options) {
    // Remove C runner
    delete options.runners['C (simple)'];
    
    var config = require("./client-default")(options);
    


    var includes = [

    ];
    
    var excludes = {

"plugins/c9.ide.help.support/support":true,
"plugins/c9.ide.help/help":true,
"plugins/c9.ide.preview/preview":true,
"plugins/c9.ide.preview/previewer":true,
"plugins/c9.ide.preview/previewers/raw":true,
"plugins/c9.ide.preview.browser/browser":true,
"plugins/c9.ide.preview.markdown/markdown":true,

"plugins/c9.ide.plugins/test":true,
"plugins/c9.ide.test/test":true,
"plugins/c9.ide.test.mocha/mocha":true,
"plugins/c9.ide.test/testpanel":true,
"plugins/c9.ide.test/testrunner":true,
"plugins/c9.ide.test/all":true,
"plugins/c9.ide.test/results":true,
"plugins/c9.ide.test/coverage":true,
"plugins/c9.ide.test/coverageview":true,         


"plugins/c9.ide.run/run":true, 
"plugins/c9.ide.run.build/build":true, 
"plugins/c9.ide.run.debug/debug":true, 
"plugins/c9.ide.run.debug.xdebug/xdebug":true, 
"plugins/c9.ide.run/gui":true, 
"plugins/c9.ide.run.build/gui":true, 
"plugins/c9.ide.run.debug/debuggers/debugger":true, 
"plugins/c9.ide.run.debug/debuggers/v8/v8debugger":true, 
"plugins/c9.ide.run.debug/breakpoints":true, 
"plugins/c9.ide.run.debug/debugpanel":true, 
"plugins/c9.ide.run.debug/callstack":true, 
"plugins/c9.ide.immediate/evaluators/debugnode":true, 
"plugins/c9.ide.run.debug/variables":true, 
"plugins/c9.ide.run.debug/watches":true, 
"plugins/c9.ide.run.debug/liveinspect":true, 
"plugins/c9.ide.run.debug/debuggers/gdb/gdbdebugger":true, 
"plugins/c9.ide.run/output":true, 

"plugins/c9.ide.login/login":true, 
"plugins/c9.ide.scm/scm":true, 
"plugins/c9.ide.scm/scmpanel":true, 
"plugins/c9.ide.scm/detail":true, 
"plugins/c9.ide.scm/log":true, 
"plugins/c9.ide.scm/git":true, 
"plugins/c9.ide.scm/editor":true, 

"plugins/c9.ide.welcome/welcome":true, 

  };
    
    config = config.concat(includes).map(function(p) {
        if (typeof p == "string")
            p = { packagePath: p };
        return p;
    }).filter(function (p) {
        if (p.packagePath == "plugins/c9.ide.layout.classic/preload") {
            p.defaultTheme = "flat-light"; // set flat theme as default
        }
        else if (p.packagePath == "plugins/c9.core/settings") {
            if (p.settings)
                p.settings.user = {}; // reset user settings
        }
        return !excludes[p.packagePath];
    });

    config.push("plugins/c9.ide.everteam/everteam")

    
    return config;
};
