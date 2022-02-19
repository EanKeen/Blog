# shellcheck shell=bash

task.generate() {
	local -a pages=(
		posts
		posts/new-blog
		posts/render-latex-with-katex-in-hugo-blog
		posts/fibonacci-equation-using-pascals-triangle-part-1
		posts/fibonacci-equation-using-pascals-triangle-part-2
		posts/creating-website-for-robotics-club
		posts/front-end-web-dev-a-years-reflection
		posts/fiddling-with-ubuntu-server-images
		posts/fixing-my-internal-network
		posts/terminal-automation-with-expect
	)

	for dir in "${pages[@]}"; do
		mkdir -p "./$dir"
		cat > "./$dir/index.html" <<EOF
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta
			http-equiv="refresh"
			content="0; url=https://hyperupcall.github.io/blog/$dir"
		/>
		<script>
			window.location.href = 'https://hyperupcall.github.io/blog/posts/$dir'
		</script>
	</head>
	<body>
		<p>
			If you are not redirected automatically, click 
			<a href="https://hyperupcall.github.io/blog/$dir">here</a>
		</p>
	</body>
</html>
EOF
	done

}
