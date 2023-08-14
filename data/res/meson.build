blueprints = custom_target('blueprints',
  input: files(
    'ui/window.blp',
    'gtk/help-overlay.blp',
  ),
  output: '.',
  command: [find_program('blueprint-compiler'), 'batch-compile', '@OUTPUT@', '@CURRENT_SOURCE_DIR@', '@INPUT@'],
)


imager_resources = gnome.compile_resources('imager-resources',
  'imager.gresource.xml',
  dependencies: blueprints,
  c_name: 'imager'
)