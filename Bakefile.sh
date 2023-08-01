# shellcheck shell=bash

task.prettier() {
	./node_modules/.bin/prettier --write .
}

task.generate() {
	local -a pages=(
		''
		posts/new-blog
		posts/render-latex-with-katex-in-hugo-blog
		posts/fibonacci-equation-using-pascals-triangle-part-1
		posts/fibonacci-equation-using-pascals-triangle-part-2
		posts/creating-website-for-robotics-club
		posts/front-end-web-dev-a-years-reflection
		posts/fiddling-with-ubuntu-server-images
		posts/fixing-my-internal-network
		posts/terminal-automation-with-expect
		new-blog
		render-latex-with-katex-in-hugo-blog
		fibonacci-equation-using-pascals-triangle-part-1
		fibonacci-equation-using-pascals-triangle-part-2
		creating-website-for-robotics-club
		front-end-web-dev-a-years-reflection
		fiddling-with-ubuntu-server-images
		fixing-my-internal-network
		terminal-automation-with-expect
	)

	for dir in "${pages[@]}"; do
		local route=posts/${dir#posts/}

		mkdir -p "./$dir"
		cat > "./$dir/index.html" <<EOF
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="canonical" href="https://hyperupcall.github.io/blog/$route" />
		<meta http-equiv="refresh" content="0; url=https://hyperupcall.github.io/blog/$route" />
		<script>
			window.location.href = 'https://hyperupcall.github.io/blog/$route'
		</script>
	</head>
	<body>
		<!-- prettier-ignore -->
		<p>
			If you are not redirected automatically, click 
			<a href="https://hyperupcall.github.io/blog/$route">here</a>
		</p>
	</body>
</html>
EOF
	done
}
