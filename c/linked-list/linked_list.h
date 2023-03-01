#ifndef LINKED_LIST_H
#define LINKED_LIST_H

#include <stddef.h>

typedef int ll_data_t;
struct list;

struct list *list_create(void);
struct list_node *node_create(ll_data_t data);
size_t list_count(const struct list *list);
void list_push(struct list *list, ll_data_t item_data);
ll_data_t list_pop(struct list *list);
void list_unshift(struct list *list, ll_data_t item_data);
ll_data_t list_shift(struct list *list);
void list_delete(struct list *list, ll_data_t data);
void list_destroy(struct list *list);

#endif
