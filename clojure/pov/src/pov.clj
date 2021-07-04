(ns pov)

(defn- reparent [parent child]
  (conj child (into [] (remove #{child} parent))))

(defn of
  ([target graph] (of target graph graph))
  ([target [label & subgraph] reparented]
   (if (= target label)
     reparented
     (first (keep #(of target % (reparent reparented %)) subgraph)))))

(defn- path-to
  ([target graph] (path-to target graph []))
  ([target [label & subgraph] path]
   (when label
     (if (= target label)
       (conj path label)
       (first (keep #(path-to target % (conj path label)) subgraph))))))

(defn path-from-to [from to graph]
  (path-to to (of from graph)))