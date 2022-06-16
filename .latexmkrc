# -*- mode: Perl;-*-

push @extra_lualatex_options, '-synctex=1 -shell-escape';

# Lualatex
$pdf_mode = 4;
# Biblatex
$bibtex_use = 2;

# Rensar upp
@generated_exts = ( 'aux', 'bbl', 'bcf', 'blg', 'fls', 'glg', 'glo', 'gls',
    'gls', 'ist', 'out', 'run.xml', 'xmpi', 'toc', 'tdo', 'acn', 'alg', 'acr', 'xmpi');

# Skapar ordlistan
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
	system "makeglossaries  -s '$_[0].ist' '$_[0]'";
}

# Ser till att filerna hittas
ensure_path('TEXINPUTS', './tex');
ensure_path('BIBINPUTS', './tex');

$out_dir = 'out/aux';
@default_files = "tex/Diplomarbete";
