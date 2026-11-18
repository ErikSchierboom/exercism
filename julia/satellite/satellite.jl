struct Tree
    root::String
    left::Union{Tree,Nothing}
    right::Union{Tree,Nothing}
end

function tree_from_traversals(preorder, inorder)
    length(preorder) == length(inorder) || throw(ArgumentError("Traversals must have the same length"))
    sort(preorder) == sort(inorder) || throw(ArgumentError("Traversals must be consistent"))
    allunique(preorder) || throw(ArgumentError("Traversals must not have repeated items"))

    if isempty(preorder)
        return nothing
    end

    hd = popfirst!(preorder)
    hdidx = findfirst(isequal(hd), inorder)

    left_inorder, right_inorder = inorder[1:(hdidx-1)], inorder[(hdidx+1):end]
    left_preorder, right_preorder = preorder[1:length(left_inorder)], preorder[(length(left_inorder)+1):end]

    left = tree_from_traversals(left_preorder, left_inorder)
    right = tree_from_traversals(right_preorder, right_inorder)
    Tree(hd, left, right)
end
