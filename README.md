asktheeu-theme
==============

This is the AskTheEU theme for Alaveteli. The intention is to 
support simple overlaying of templates and resources without the 
need to touch the core Alaveteli software.

This theme contains:

 * CSS-based customisations in lib/views/general/custom_css.rhtml

 * Custom versions of non-functional pages (like "about
   us", at lib/views/help/about.rhtml -- and/or localised versions at
   lib/views/help/about.es.rhtml)

Look in the lib/ folder of the plugin to see how the overrides happen.

To install:
-----------
 
  ./script/plugin install git://github.com/dcabo/asktheeu-theme.git

A symbolic link will be created automatically in the `public/` folder
of the main app, pointing to the `public/` folder of the theme, in 
order to serve static assets.

To uninstall:
-------------

  ./script/plugin remove git://github.com/dcabo/asktheeu-theme.git

The symbolic link created during the installation will be removed 
automatically.