using CairoMakie
using Colors

# Define color 
julia_green = RGB(0.22,0.596,0.149)
julia_red = RGB(0.796,0.235,0.2)
julia_purple = RGB(0.584,0.345,0.698)
julia_blue = RGB(0.251,0.392,0.843)

# Create a figure
begin
  fig = Figure(size = (600, 600))
  ax = Axis(fig[1, 1], aspect = 1, backgroundcolor = :white)

  # Side panels (purple)
  poly!(ax, [Point2f(-1.0, -1.0), Point2f(1, -1.0), Point2f(1, 0), Point2f(-1.0, 0)], color=:black, strokewidth=4, strokecolor=:black)

  # Draw MRI machine components
  # Outer circle (MRI scanner body)
  poly!(Circle(Point2f(0, 0), 1.0), color = :white,strokecolor=:black, strokewidth=4)
  
  # Inner circle (scanner tunnel)
  poly!(Circle(Point2f(0, 0), 0.7), color = :black,strokecolor=:black, strokewidth=4)
  poly!(Circle(Point2f(0, 0), 0.4), color = :white,strokecolor=:black, strokewidth=4)

  # table  (blue)
  poly!(ax, 
        [ Point2f(-0.4, -0.8), 
          Point2f(0.4, -0.8), 
          Point2f(0.25, -0.3), 
          Point2f(-0.25, -0.3)], 
          color=:white, 
          strokewidth=4, 
          strokecolor=:black)

  poly!(ax, Rect(-0.4, -1.1, 0.8, 0.3), color=:white, strokewidth=4, strokecolor=:black)
  text!(ax, position = Point2f(-0.4, -1.1),
         "", 
         color=:black,
         fontsize=90,
         font = :bold,
         offset = (20,-15))

  # Green buttons
  stroke_circle = 0
  radius = 0.06
  poly!(Circle(Point2f(0.84, 0.15), radius), color = julia_green,strokecolor=:black, strokewidth=stroke_circle)
  poly!(Circle(Point2f(0.91, 0.025), radius), color = julia_red,strokecolor=:black, strokewidth=stroke_circle)
  poly!(Circle(Point2f(0.78, 0.025), radius), color = julia_purple,strokecolor=:black, strokewidth=stroke_circle)
  #poly!(Circle(Point2f(w+0.85, h+0.2), 0.04), color = julia_green,strokecolor=:black, strokewidth=4)
  
  # 
  poly!(ax, Rect(-0.2, 0.73, 0.4, 0.2), color=julia_blue, strokewidth=stroke_circle, strokecolor=:black)


  hidedecorations!(ax)
  hidespines!(ax)
  fig
end

save("logo_makie.png", fig)