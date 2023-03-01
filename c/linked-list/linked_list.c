#include "linked_list.h"

#include <stdlib.h>
#include <stdio.h>

struct list_node
{
   struct list_node *prev, *next;
   ll_data_t data;
};

struct list
{
   struct list_node *first, *last;
};

struct list *list_create(void)
{
   struct list *l = malloc(sizeof(struct list));
   l->first = NULL;
   l->last = NULL;
   return l;
}

struct list_node *node_create(ll_data_t data)
{
   struct list_node *node = malloc(sizeof(struct list_node));
   node->data = data;
   node->next = NULL;
   node->prev = NULL;
   return node;
}

size_t list_count(const struct list *list)
{
   size_t count = 0;

   for (struct list_node *current = list->first; current; current = current->next)
      count++;

   return count;
}

void list_push(struct list *list, ll_data_t item_data)
{
   struct list_node *new_node = node_create(item_data);
   new_node->prev = list->last;

   if (new_node->prev)
      new_node->prev->next = new_node;

   list->last = new_node;
   list->first = list->first ? list->first : new_node;
}

ll_data_t list_pop(struct list *list)
{
   struct list_node *last = list->last;
   ll_data_t data = last->data;
   list->last = last->prev;
   if (list->last)
      list->last->next = NULL;
   else
      list->first = NULL;
   free(last);
   return data;
}

void list_unshift(struct list *list, ll_data_t item_data)
{
   struct list_node *new_node = node_create(item_data);
   new_node->next = list->first;

   if (new_node->next)
      new_node->next->prev = new_node;

   list->first = new_node;
   list->last = list->last ? list->last : new_node;
}

ll_data_t list_shift(struct list *list)
{
   struct list_node *first = list->first;
   ll_data_t data = first->data;
   list->first = first->next;
   if (list->first)
      list->first->prev = NULL;
   else
      list->last = NULL;
   free(first);
   return data;
}

void list_delete(struct list *list, ll_data_t data)
{
   for (struct list_node *current = list->first; current; current = current->next)
   {
      if (current->data == data)
      {
         if (current == list->first)
            list->first = current->next;
         else
            current->prev->next = current->next;

         if (current == list->last)
            list->last = current->prev;
         else
            current->next->prev = current->prev;

         free(current);
         return;
      }
   }
}

void list_destroy(struct list *list)
{
   struct list_node *current = list->first;

   while (current)
   {
      struct list_node *tmp = current->next;
      free(current);
      current = tmp;
   }

   free(list);
}