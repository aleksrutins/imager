imager_sources = [
  'main.vala',
]

subdir('core')
subdir('util')
subdir('ui')

imager_deps = [
  dependency('gtk4'),
  dependency('libadwaita-1', version: '>= 1.2'),
]

executable('imager',
	imager_resources,
	imager_sources,

     vala_args: ['--gresourcesdir=data/res/'],
  dependencies: imager_deps,
       install: true,
)
