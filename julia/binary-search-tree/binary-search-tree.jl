mutable struct BinarySearchTree{T}
    data::T
    left::Union{BinarySearchTree{T},Nothing}
    right::Union{BinarySearchTree{T},Nothing}
end

function BinarySearchTree(data::AbstractVector{T}) where T
    first = popfirst!(data)
    root = BinarySearchTree{T}(first, nothing, nothing)
    for value in data
        insert!(root, value)
    end
    root
end

function insert!(tree::BinarySearchTree{T}, value::T) where T
    if value <= tree.data
        if isnothing(tree.left)
            tree.left = BinarySearchTree{T}(value, nothing, nothing)
        else
            insert!(tree.left, value)
        end
    else
        if isnothing(tree.right)
            tree.right = BinarySearchTree{T}(value, nothing, nothing)
        else
            insert!(tree.right, value)
        end
    end

    tree
end

function Base.sort(tree::BinarySearchTree{T}) where T
    result = T[]
    function inorder(node)
        if isnothing(node)
            return
        end
        inorder(node.left)
        push!(result, node.data)
        inorder(node.right)
    end
    inorder(tree)
    result
end

nodedata(tree::BinarySearchTree) = tree.data
rightnode(tree::BinarySearchTree) = tree.right
leftnode(tree::BinarySearchTree) = tree.left
