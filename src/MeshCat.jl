__precompile__()

module MeshCat

using GeometryTypes
using CoordinateTransformations
using Rotations: rotation_between

using Colors: Color, Colorant, RGB, RGBA, alpha
using StaticArrays: StaticVector, SVector, SDiagonal
using GeometryTypes: raw
using Parameters: @with_kw
using Base.Random: UUID, uuid1
using DocStringExtensions

using WebIO
using JSExpr

import Base: delete!, length
import MsgPack: pack, Ext
import GeometryTypes: origin, radius

export Visualizer,
       ViewerWindow,
       IJuliaCell,
       HyperEllipsoid,
       HyperCylinder,
       PointCloud,
       Triad,
       PointsMaterial,
       MeshLambertMaterial,
       MeshBasicMaterial,
       MeshPhongMaterial,
       Texture,
       PngImage,
       Mesh,
       Points,
       LineSegments,
       setobject!,
       settransform!,
       delete!,
       handler

include("trees.jl")
using .SceneTrees
include("geometry.jl")
include("objects.jl")
include("commands.jl")
include("lowering.jl")
include("msgpack.jl")
include("visualizer.jl")

@deprecate IJuliaCell(vis::Visualizer) WebIO.render(vis)

handler(vis::Visualizer) = req -> vis.core.scope

end
