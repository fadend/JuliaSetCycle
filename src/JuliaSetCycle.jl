module JuliaSetCycle

using GLMakie

export make_julia_set_cycle_animation

function julia_set(x, y, c; max_iter = 100)
    z = x + y * im
    for i = 1:max_iter
        if abs2(z) > 4
            return i
        end
        z = z^2 + c
    end
    return 0
end

function make_julia_set_cycle_animation(
    path::AbstractString;
    c::Complex = -0.7269 + 0.1889im,
    width::Int64 = 500,
    max_iter::Int64 = 100,
    num_frames::Int64 = 100,
)
    x = LinRange(-2, 2, width)
    y = LinRange(-2, 2, width)
    matrix = julia_set.(x, y', c; max_iter = max_iter)
    fig, ax, hm = heatmap(x, y, matrix)
    record(fig, path, 1:num_frames) do i
        angle = 2pi * (i - 1) / N
        hm[3] = julia_set.(x, y', c * (cos(angle) + im * sin(angle)))
    end
end

end # module JuliaSetCycle
