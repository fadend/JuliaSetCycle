Little tool to create an animation of Julia sets. Given a starting `c`, cycles around the origin starting at it.

This is based on the Mandelbrot set example at https://docs.makie.org/dev/explanations/animation.

## Usage

```
julia> import JuliaSetCycle
julia> JuliaSetCycle.make_julia_set_cycle_animation("julia_set_animation.mp4")
```
